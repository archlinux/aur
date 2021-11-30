# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=gnuplot_kernel
pkgname=jupyter-${_base}
pkgver=0.4.1
pkgrel=4
pkgdesc="A Jupyter/IPython kernel for gnuplot"
arch=('any')
url="https://github.com/has2k1/${_base}"
license=(BSD)
depends=(jupyter-metakernel gnuplot)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
install=${pkgname}.install
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('00e51bc5cf77d3618ed53e0e2224d0b03ac4ac4a283d9991896a4a84abe441c0fd2ec592afd5a4415e84dfd2d3b707a13de43bbd002d3be1585e308e0942a6fd')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  pytest
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
