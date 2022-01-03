# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matadi
pkgname=python-${_base}
pkgdesc="Material Definition with Automatic Differentiation"
pkgver=0.0.27
pkgrel=1
arch=('any')
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(casadi)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4fa8d13b523fda93159338e0782fe38f247b8ca2d801ea321fa869ff6cfd88143aaf0fdb2908b8377e959bd59ee6bf28be1b9d09763425668ad8a29cb8c8b01c')

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
