# Maintainer: entshuld [edgar (not at) openmail dot cc]
# Contributor: Sigvald Marholm <marholm@marebakken.com>
# Contributor: Georg S. Voelker <voelker@maibox.org>
# Based on python-fiat-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>
_base=fiat
pkgname=python-${_base}
pkgdesc="FInite element Automatic Tabulator"
pkgver=2019.1.0
pkgrel=2
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(LGPL-3.0-or-later)
depends=(python-numpy python-sympy)
makedepends=(python-setuptools)
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('15de17b2a28ba5071c0dd9ecc05ec36eeae76de3aa9f068577d43b7526778116e2ded412fa8c26189e7c505881dd2b68b2c45704c8446d9ef9d9d3797c3592e6')

build() {
	cd ${_base}-${pkgver}
	python setup.py build
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
