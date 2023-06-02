# Maintainer: Grafcube <grafcube at disroot dot org>

_pypkgname=docopt_ng
_pkgname=docopt-ng
pkgname=python-${_pkgname}
pkgver=0.9.0
pkgrel=1
pkgdesc="Jazzband-maintained fork of docopt, the humane command line arguments parser."
url="https://github.com/jazzband/docopt-ng"
depends=('python' 'python-regex')
makedepends=('python-pdm' 'python-installer')
checkdepends=('python-pdm')
license=('MIT')
arch=('any')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cda61705e203000e6e0add5bfd4038c75447bc8ea2c6fc7288ed6d3ade4cc38c')

build() {
	cd "${_pkgname}-${pkgver}"
	pdm config check_update false
	pdm sync -d -G dev
	pdm build
}

check() {
	cd "${_pkgname}-${pkgver}"
	pdm run pytest
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" "dist/${_pypkgname}-${pkgver}-py3-none-any.whl"
}
