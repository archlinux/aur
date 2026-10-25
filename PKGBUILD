# Maintainer: John Ettedgui <git@johne.rojalabs.com>

pkgname=python-sqlakeyset
_pyname=sqlakeyset
_sdist=${_pyname//-/_}
pkgver=2.0.1787969905
pkgrel=1
pkgdesc='Offset-free paging for SQLAlchemy'
arch=('any')
url='https://github.com/djrobstep/sqlakeyset'
license=('Unlicense')
depends=('python-dateutil' 'python-packaging' 'python-sqlalchemy')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$_sdist-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname:0:1}/$_pyname/$_sdist-$pkgver.tar.gz")
sha256sums=('aade1e9cd75d47d01ee486b327d83b59b16e78443aa432189d34185e347d7ed4')

# Version pinned to the one resolved in Honcho 3.4.0's uv.lock (Honcho requires
# >=2.0.1787969905,<3).

build() {
  cd "$_sdist-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_sdist-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Upstream's tests need a database matrix; not run.
