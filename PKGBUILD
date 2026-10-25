# Maintainer: John Ettedgui <git@johne.rojalabs.com>

pkgname=python-fastapi-pagination
_pyname=fastapi-pagination
_sdist=${_pyname//-/_}
pkgver=0.16.1
pkgrel=1
pkgdesc='Pagination support for FastAPI'
arch=('any')
url='https://github.com/uriyyo/fastapi-pagination'
license=('MIT')
depends=('python-fastapi' 'python-pydantic' 'python-typing_extensions')
optdepends=(
  'python-sqlalchemy: SQLAlchemy extension'
  'python-sqlakeyset: keyset pagination for the SQLAlchemy extension'
)
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$_sdist-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_sdist-$pkgver.tar.gz")
sha256sums=('c43a4286f7dd4c25501da7f5ae84a89172d3c5f3c4a93b4bc8c6639ed754d11d')

# Honcho requires >=0.14.2.  The 0.15.x line still calls
# fastapi.dependencies.utils.get_body_field, which current FastAPI releases no
# longer provide; 0.16.x is the line built against FastAPI >= 0.140.13.

build() {
  cd "$_sdist-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_sdist-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Upstream's tests need pytest plus a matrix of database backends; not run.
