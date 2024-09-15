# Maintainer: Lex Black <autumn-wind@web.de>

_module=narwhals
pkgname=python-${_module}
pkgver=1.8.1
pkgrel=1
pkgdesc="Extremely lightweight compatibility layer between dataframe libraries"
arch=(any)
url="https://github.com/narwhals-dev/narwhals"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('python-pandas: for Pandas support'
            'python-polars: for Polars support'
            'python-pyarrow: for PyArrows support')
source=(https://github.com/narwhals-dev/narwhals/releases/download/v${pkgver}/${_module}-${pkgver}.tar.gz)
sha256sums=('97527778e11f39a1e5e2113b8fbb9ead788be41c0337f21852e684e378f583e8')


build() {
  cd "${_module}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_module}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
