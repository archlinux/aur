# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-proto"
_name=${pkgname#python-}
pkgver="24.02.1"
pkgrel=1
pkgdesc="This package implements some of the Lightning Network protocol in pure python. It is intended for protocol testing and some minor tooling only. It is not deemed secure enough to handle any amount of real funds (you have been warned!)."
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-proto"
license=("custom:BSD-MIT")
depends=("python" "python-base58" "python-bitstring" "python-coincurve" "python-cryptography" "python-pysocks")
makedepends=("python-setuptools" "python-poetry")
provides=("python-pyln-proto")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=('SKIP')

prepare() {
	mv "clightning-v$pkgver"/"contrib"/"pyln-proto" "$_name-$pkgver"
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
