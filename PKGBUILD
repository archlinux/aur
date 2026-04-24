# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pathspec
pkgname=pypy3-${_base}
pkgdesc="Utility library for gitignore style pattern matching of file paths"
pkgver=1.1.0
pkgrel=1
arch=(any)
url="https://github.com/cpburnz/python-${_base}"
license=(MPL2)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-flit-core)
source=(python-${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('07980473df0b9615553a4f904b59a65d558bad9b22be99c88ab4b4bdba6c967310404a3910d480534e2f0c53f7ac534b3f455d552c5ef6ea38fbae0e2dc289f4')

build() {
  cd python-${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd python-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
