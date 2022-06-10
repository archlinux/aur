# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Joshua Leahy <jleahy@gmail.com>

_base=freetype-py
pkgname=python-${_base}
pkgver=2.3.0
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=(any)
url="https://github.com/rougier/${_base}"
license=('BSD')
depends=(python freetype2)
makedepends=(python-setuptools-scm)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('877641b16d7dbf16e41333733844c76dcefbbe1f88edd6cf4ab2158de4c1c05d23e18982d2a34a5c3e8ea0d5d92c40136788b0cb1afaad2a4ada17226517c8c6')

export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
