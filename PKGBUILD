# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matadi
pkgname=python-${_base}
pkgdesc="Material Definition with Automatic Differentiation"
pkgver=0.1.15
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(casadi)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('81d029648612d1e9d32930542571b7b8146842081f5b81085b45f58d44f13fcee13a3a177f7eec620cbda95600ac841d79b30846259866abf1c13731c7f36368')

build() {
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
