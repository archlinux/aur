# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=pybind11
pkgname=pypy3-${_base}
pkgver=3.0.3
pkgrel=1
pkgdesc="A lightweight header-only library that exposes C++ types in Python and vice versa"
arch=(any)
url="https://${_base}.readthedocs.org"
license=(BSD-3-Clause)
depends=(pypy3)
makedepends=(boost cmake eigen pypy3-build pypy3-installer pypy3-scikit-build-core)
source=(https://github.com/${_base::6}/${_base}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d6846dc88234a355f9ff312cfd0ecb8d3c7bb0e446ea5fcfc931ed7f18d56206e2b02662cdbd8d8d940a9f67b195dabfa13585f4bb1d57cb1af8a9c39a447a79')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
