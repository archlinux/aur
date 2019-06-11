# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-onnx
_pkgname=onnx
pkgver=1.5.0
pkgrel=1
pkgdesc='Open Neural Network Exchange'
arch=('x86_64')
url=https://onnx.ai
license=('MIT')
depends=(protobuf pybind11 python-numpy python-six)
makedepends=(python-setuptools pybind11 cmake)
checkdepends=(python-nose python-pytest python-scipy)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/onnx/onnx/archive/v${pkgver}.tar.gz")
sha512sums=('0dd8ac3210331352f0c97383a36c7c9943f1885491ccb3e2c54ebcfb472ff41b192fe701ba82a1a33251158d9b99ff626b429e33b48921151302de8d0e81b82e')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

#check() {
#  cd onnx-$pkgver
#  pytest -v
#}

package() {
  cd "${_pkgname}-${pkgver}"
  export CC=/opt/cuda/bin/gcc
  export CXX=/opt/cuda/bin/g++
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
