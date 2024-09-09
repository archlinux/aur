# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=installer
pkgname=pypy3-${_base}
pkgver=0.7.0
pkgrel=1
pkgdesc="A low-level library for installing from a Python wheel distribution"
arch=(any)
url="https://${_base}.pypa.io"
license=(MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-flit-core)
source=(${_base}-${pkgver}.tar.gz::https://github.com/pypa/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('a509c6ea9d88b8527cce0428ca6109077820cb9aa352967a389012bac40f8ec04039ab73710f4fb32b32ed20affd520ce0ba16ba18d9d380ce0af1f51fe8e2c6')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" PYTHONPATH=src pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
