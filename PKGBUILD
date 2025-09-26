# Maintainer: Luca Kredel <luca dot kredel at web dot de>
pkgname=bomdia
pkgver=v0.1.0
pkgrel=3
epoch=
pkgdesc=""
arch=(any)
url="https://codeberg.org/Phosphenius/bomdia"
license=('AGPL-3.0-only')
depends=(
	'python>=3.13'
	python-argcomplete
)
makedepends=(
	python-build
	python-installer
	python-setuptools)
checkdepends=()
conflicts=("$pkgname-git")
backup=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ebf9529715414c02e15a3aa4d2b0b0f176f39ec5d009474a9acc688875770344')
validpgpkeys=()

build() {
	cd "$pkgname"

	python3 -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"

	python3 -m installer --destdir="$pkgdir" dist/*.whl

	make -f install.mk DESTDIR="$pkgdir/" install
}
