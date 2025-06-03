# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=editables
pkgname=pypy3-${_base}
pkgdesc="Editable installations"
pkgver=0.5
pkgrel=1
arch=(any)
url="https://github.com/pfmoore/${_base}"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-flit-core)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ac39d2e6a51625697c517b85fec11b525b1a41f82cf4f55c7595fed19da867065a62eee5e3656706f7402d0499754f4a142da77d699c59dffc8b769fa1c3dbe2')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
