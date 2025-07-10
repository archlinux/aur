# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=visualdl
pkgdesc="Deep Learning Visualization Toolkit"
pkgver=3.0.0
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${pkgname}"
license=(Apache-2.0)
depends=(python-baidubce python-flake8 python-flask-babel python-pillow python-protobuf python-requests python-matplotlib python-pandas)
makedepends=(shellcheck rustup npm yarn) # python-setuptools
source=(VisualDL-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d4cb17950199467752b19a227fac1814e87b4a4ec50eb21be6a4d02cfe3b506e087d21263040b1108ec2f82a7d4bedae8c4e80f03a97ad1c2f7e2b1342f9b008')

build() {
  cd "VisualDL-${pkgver}"-beta
  export RUSTUP_TOOLCHAIN=stable
  python setup.py build
}

package() {
  cd "VisualDL-${pkgver}"-beta
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
