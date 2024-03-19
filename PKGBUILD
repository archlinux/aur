# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-client"
_name=${pkgname#python-}
pkgver="24.02.1"
pkgrel=1
pkgdesc="Client library and plugin library for Core Lightning"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-client"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-bolt7" "python-pyln-proto")
makedepends=("python-setuptools" "python-poetry")
provides=("python-pyln-client")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=('SKIP')

prepare() {
	mv "clightning-v$pkgver"/"contrib"/"pyln-client" "$_name-$pkgver"
	rm -rf "clightning-v$pkgver"
}

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
