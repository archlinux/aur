# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-proto"
_name=${pkgname#python-}
pkgver="24.08"
pkgrel=1
pkgdesc="This package implements some of the Lightning Network protocol in pure python. It is intended for protocol testing and some minor tooling only. It is not deemed secure enough to handle any amount of real funds (you have been warned!)."
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-proto"
license=("custom:BSD-MIT")
depends=("python" "python-base58" "python-bitstring" "python-coincurve" "python-cryptography" "python-pysocks")
makedepends=("python-build" "python-installer" "python-poetry" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${pkgver}/clightning-v${pkgver}.zip")
sha256sums=("bb876455c75db9306e444eb5e663f1eba53c38565278c74bd9f3493681db5717")

build() {
	cd "clightning-v$pkgver"/"contrib"/"pyln-proto"
	python -m build --wheel --no-isolation
}

package() {
	cd "clightning-v$pkgver"/"contrib"/"pyln-proto"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
