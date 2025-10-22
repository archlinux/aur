# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=spectroterm-git
pkgver=0.5.3
pkgrel=1
pkgdesc="Curses based terminal spectrum analyzer for currently playing audio"
arch=('any')
url="https://github.com/mzivic7/spectroterm"
license=('GPL-3.0-only')
depends=()
provides=('spectroterm')
conflicts=('spectroterm')
makedepends=('python>=3.12' 'uv' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "spectroterm"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "spectroterm"
	uv sync
}

build() {
	cd "spectroterm"
	uv run build.py
}

package() {
	cd "spectroterm"
	install -Dm755 ./dist/spectroterm "$pkgdir/usr/bin/spectroterm"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/spectroterm/README.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/spectroterm/LICENSE"
}
