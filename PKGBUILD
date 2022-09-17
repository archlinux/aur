# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=visualdl
pkgdesc="Deep Learning Visualization Toolkit"
pkgver=2.4.1
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${pkgname}"
license=(Apache)
depends=(python-baidubce flake8 python-flask-babel python-pillow python-protobuf python-requests python-matplotlib python-pandas)
makedepends=(shellcheck rustup npm yarn) # python-setuptools
source=(VisualDL-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f1cf4ce4e405615aaec5594edf8410d595f4602328b0366bdc5ad87389dd1d5d9068d424ab1639fb349fe77f6cbc5a85474d6e192ab8fcb1f43559021dcd667b')

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
