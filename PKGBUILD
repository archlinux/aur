# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Mark Oteiza <mvoteiza@udel.edu>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=colorspacious
pkgname=python-${_base}
pkgdesc="A powerful, accurate, and easy-to-use Python library for doing colorspace conversions"
pkgver=1.1.2
pkgrel=2
arch=('any')
url="https://github.com/njsmith/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(python-nose)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c633ba1ee051eab055d74752b3efd02fdff9acd641f245d80339d698bf4f5a28701158a50ddd2c372730d7e5cbb1e29858c4acd1f3594e07fe7bdfaa2fed87f6')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  nosetests --all-modules "${_base}-${pkgver}"
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
