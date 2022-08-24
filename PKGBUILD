# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=visualdl
pkgdesc="Deep Learning Visualization Toolkit"
pkgver=2.4.0
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${pkgname}"
license=(Apache)
depends=(python-baidubce flake8 python-flask-babel python-pillow python-protobuf python-requests python-matplotlib python-pandas)
makedepends=(shellcheck rustup npm yarn) # python-setuptools
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('847657904abe10792e605fee25b5adb859f66227552d3e94e24987176f9c449ce4932a88eb2b434feaacfc14381d8abe569acd3597ea00999e929ac547be74e7')

prepare() {
  sed -i '/shellcheck/d' "VisualDL-${pkgver}/requirements.txt"
}

build() {
  cd "VisualDL-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  python setup.py build
}

package() {
  cd "VisualDL-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
