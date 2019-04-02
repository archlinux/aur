# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=gluon-cv
pkgname=python-gluoncv
pkgver=0.4.0
pkgrel=1
pkgdesc='A Deep Learning Toolkit for Computer Vision'
arch=(any)
url=https://gluon-cv.mxnet.io
license=('Apache')
depends=(mxnet python-matplotlib python-numpy python-scipy)
makedepends=(python-setuptools)
checkdepends=(python-nose python-pytest python-scipy)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dmlc/gluon-cv/archive/v${pkgver}.tar.gz")
sha512sums=('4ed486237c86a1b4b4aefee655af32e0dc81c10d421b7fbdd0d57bfbbcaa4ebf9f23b4a763afb087f73853f637c4b01acebcff81b765dd55136fe39a59f7a223')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -v
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
