# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=spectroterm-git
pkgver=0.4.7
pkgrel=1
pkgdesc="Curses based terminal spectrum analyzer for currently playing audio"
arch=('any')
url="https://github.com/mzivic7/$pkgname"
license=('GPL')
depends=()
makedepends=('python>=3.11' 'python-pipenv' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	uv sync
}

build() {
	cd "$pkgname"
	uv run build.py
}

package() {
	cd "$pkgname"
	install -Dm755 ./dist/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
