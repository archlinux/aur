# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=editables
pkgname=pypy3-${_base}
pkgdesc="Editable installations"
pkgver=0.6
pkgrel=1
arch=(any)
url="https://github.com/pfmoore/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-flit-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('123a5aec65cfa259dddfd6a8c0e4a51f5ad722e36cd360fd4d5094b853805b0332ec1b143a19e5fae79e5f841124bbd6162bb6fe64d8d92d7edcf5b640afcdc4')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
