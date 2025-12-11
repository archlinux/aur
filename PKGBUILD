# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-proto"
_name=${pkgname#python-}
pkgver="25.12"
_clightning_pkgver="25.12"
pkgrel=1
pkgdesc="This package implements some of the Lightning Network protocol in pure python. It is intended for protocol testing and some minor tooling only. It is not deemed secure enough to handle any amount of real funds (you have been warned!)."
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-proto"
license=("custom:BSD-MIT")
depends=("python" "python-base58" "python-bitstring" "python-coincurve" "python-cryptography" "python-pysocks")
makedepends=("python-build" "python-installer" "python-hatchling" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${_clightning_pkgver}/clightning-v${_clightning_pkgver}.zip")
sha256sums=("9b5afc17f8df3b695339ebecb6d377467fdd44e8c17429e554ed2b3fcbc18ac6")

build() {
	cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-proto"
	python -m build --wheel --no-isolation
}

package() {
	cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-proto"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
