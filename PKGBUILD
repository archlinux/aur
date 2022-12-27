# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=visualdl
pkgdesc="Deep Learning Visualization Toolkit"
pkgver=2.4.2
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${pkgname}"
license=(Apache)
depends=(python-baidubce flake8 python-flask-babel python-pillow python-protobuf python-requests python-matplotlib python-pandas)
makedepends=(shellcheck rustup npm yarn) # python-setuptools
source=(VisualDL-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('044972ba44e11427c16cf5751224a5c8bd7c85d71b371995ea2a438e00807ae9ee29f6af701138f16c5dad2af7f5afb41dbd9050359842e346d5dc9736a0cf0e')

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
