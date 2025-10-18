# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-proto"
_name=${pkgname#python-}
pkgver="25.09"
_clightning_pkgver="25.09.1"
pkgrel=4
pkgdesc="This package implements some of the Lightning Network protocol in pure python. It is intended for protocol testing and some minor tooling only. It is not deemed secure enough to handle any amount of real funds (you have been warned!)."
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-proto"
license=("custom:BSD-MIT")
depends=("python" "python-base58" "python-bitstring" "python-coincurve" "python-cryptography" "python-pysocks")
makedepends=("python-build" "python-installer" "python-hatchling" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${_clightning_pkgver}/clightning-v${_clightning_pkgver}.zip")
sha256sums=("99a1fe49232e9d71f8dc797d145be4e4bea7e1ed3abe0b0bdd3f16df2772fa14")

build() {
	cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-proto"
	python -m build --wheel --no-isolation
}

package() {
	cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-proto"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
