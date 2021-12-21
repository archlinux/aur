# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=visualdl
pkgver=2.2.1
pkgrel=4
pkgdesc="Deep Learning Visualization Toolkit"
url="https://github.com/PaddlePaddle/${pkgname}"
depends=(python-baidubce flake8 python-flask-babel python-pillow python-protobuf python-requests python-matplotlib python-pandas)
makedepends=(python-pre-commit shellcheck rustup npm yarn) # python-setuptools
license=('Apache2')
arch=('any')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3c51486ba865e2744142a60677a960f67bfa4116df0c964e1e639b0a06591718a8a1d9ed86d8429c81f8319e3bd365d85e706b809d8814064820ef27288975be')

prepare() {
  sed -i '/pre-commit/d;/shellcheck/d' "VisualDL-${pkgver}/requirements.txt"
}

build() {
  cd "VisualDL-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  python setup.py build
}

package() {
  cd "VisualDL-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
