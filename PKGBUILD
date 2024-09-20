# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Daniel Milde <daniel@milde.cz>
_base=packaging
pkgname=pypy-${_base}
pkgver=24.1
pkgrel=2
pkgdesc="Core utilities for Python packages"
arch=(any)
url="https://${_base}.pypa.io"
license=(Apache-2.0 BSD-2-Clause)
depends=(pypy)
makedepends=(pypy-setuptools)
source=(${_base}-${pkgver}.tar.gz::https://github.com/pypa/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('45836ea0e7531c485a7d5e568f9740c7f075ff1b72a0d60422c5b76c031866428ff2137d9bd153790a9fcfff6bd4a7555bc40555409ad46debae7f1c9c1fe129')

build() {
  cd ${_base}-${pkgver}
  pypy -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
