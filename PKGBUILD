# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname="python-pyln-client"
_name=${pkgname#python-}
pkgver="25.12"
_clightning_pkgver="25.12"
pkgrel=1
pkgdesc="Client library and plugin library for Core Lightning"
arch=("any")
url="https://github.com/ElementsProject/lightning/blob/master/contrib/pyln-client"
license=("custom:BSD-MIT")
depends=("python" "python-pyln-bolt7" "python-pyln-proto")
makedepends=("python-build" "python-installer" "python-hatchling" "python-wheel")
source=("https://github.com/ElementsProject/lightning/releases/download/v${_clightning_pkgver}/clightning-v${_clightning_pkgver}.zip")
sha256sums=("9b5afc17f8df3b695339ebecb6d377467fdd44e8c17429e554ed2b3fcbc18ac6")

build() {
	cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-client"
	python -m build --wheel --no-isolation
}

package() {
	cd "clightning-v$_clightning_pkgver"/"contrib"/"pyln-client"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
