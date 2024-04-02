# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: algebro <algebro at tuta dot io>
_base=eth-typing
pkgname=python-${_base}
pkgver=4.1.0
pkgrel=1
pkgdesc="Common type annotations for ethereum python packages"
arch=(x86_64)
url="https://github.com/ethereum/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7178eab8c1686442b383adeec44ce4039dc3068ea083a54a606fe30685f5e2d3f694954df9c79120c610d78a7896b114aacb8608a80d72c035585f084682ee5a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
