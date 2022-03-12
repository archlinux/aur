# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matadi
pkgname=python-${_base}
pkgdesc="Material Definition with Automatic Differentiation"
pkgver=0.1.1
pkgrel=1
arch=('any')
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(casadi)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('8b6963fc5893b013256e674f3d1c5540bad266ce7e8aa81d4460c300dc6513f011758826269f0c759fd09455d2eca1d0deb7d1ca593c082f99ab02c9506dd2b9')

build() {
  cd "${_base}-${pkgver}"
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest tests
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
