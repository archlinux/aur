# Maintainer: Hasan Çatalgöl <hasancatalgol@gmail.com>

pkgname=python-databricks-sql-connector
pkgver=4.0.5
pkgrel=1
pkgdesc="Databricks SQL Connector for Python (DB-API 2.0; optional Arrow APIs)"
arch=('any')
url="https://github.com/databricks/databricks-sql-python"
provides=("python-databricks-sql-connector")
conflicts=("python-databricks_sql_connector")
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
optdepends=(
  'python-pyarrow: enable Arrow-based fetch APIs'
  'python-databricks-sqlalchemy: SQLAlchemy dialect (separate project)'
)

# sdist filename uses underscores
source=("https://files.pythonhosted.org/packages/source/d/databricks_sql_connector/databricks_sql_connector-$pkgver.tar.gz")
sha256sums=('ade3143b3b55e8c236bea7da8579c63c43432dd07df9dc05b1d8f2f7bbeb144e')

build() {
  cd "databricks_sql_connector-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "databricks_sql_connector-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
