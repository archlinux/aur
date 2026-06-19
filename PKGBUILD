# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tqdm
pkgname=pypy3-${_base}
pkgdesc="Fast, Extensible Progress Meter"
pkgver=4.68.3
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MPL-2.0 MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9e429482228b688cd60742ed72ae61c715149fd04697dab62f5341918ebe736579e9bd3ae931370c2a920e4c3d5e38d787b9182e088a1a2bca0696c7d8cdfd11')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/bin"
  mv "${pkgdir}/opt/pypy3/bin/tqdm" "${pkgdir}/usr/bin/tqdm-pypy3"
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
