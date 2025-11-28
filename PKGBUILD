# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=cmus-rpc-py
pkgver=0.1.2
pkgrel=1
pkgdesc="Discord rich presence integration for cmus music player"
arch=('any')
url="https://github.com/sparklost/$pkgname"
license=('GPL-3.0-only')
depends=('cmus')
makedepends=('python>=3.11' 'python-pipenv' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export PIPENV_VENV_IN_PROJECT=1
	pipenv install
}

build() {
	cd "$pkgname"
	export PIPENV_VENV_IN_PROJECT=1
	pipenv run python -m PyInstaller --noconfirm --onefile --windowed --clean --name "$pkgname" "main.py"
}

package() {
	cd "$pkgname"
	install -Dm755 ./dist/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
