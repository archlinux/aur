# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=pyviz_comms
pkgname=python-${_base}
pkgver=2.2.1
pkgrel=3
pkgdesc='Bidirectional communication for the PyViz ecosystem'
arch=(any)
url="https://github.com/pyviz/${_base}"
license=('custom:BSD-3-clause')
makedepends=(python-setuptools)
depends=(python-param jupyterlab)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7c64a9923483a0f73cc3c877b4d02b2c5dd5a90382bf7ae2f564125e14e35a3f2eac9a0a995fa502f34ac91e809986f1e58cb2c9b98c7ca6262682a37a9aea9e')

build() {
  cd ${_base}-${pkgver}
  jlpm
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
