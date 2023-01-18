# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
pkgname=visualdl
pkgdesc="Deep Learning Visualization Toolkit"
pkgver=2.5.0
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${pkgname}"
license=(Apache)
depends=(python-baidubce flake8 python-flask-babel python-pillow python-protobuf python-requests python-matplotlib python-pandas)
makedepends=(shellcheck rustup npm yarn) # python-setuptools
source=(VisualDL-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d19990a11db269370bf0c732c49e03d636b0d1e87d382019180cced25824eac1f5e73fb7c868ba89a90a1187819448dc9f50d32036cbd4ff91f301084da8c778')

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
