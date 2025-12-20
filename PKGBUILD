# Maintainer: Peter <peter.w.adams96@gmail.com>
pkgname=python-sqlit-tui
pkgver=1.1
pkgrel=1
pkgdesc="The lazygit of SQL databases - a lightweight TUI for SQL Server, PostgreSQL, MySQL, SQLite, and more"
arch=('any')
url="https://github.com/Maxteabag/sqlit"
license=('MIT')
depends=(
    'python>=3.10'
    'python-textual'
    'python-pyodbc'
    'python-pyperclip'
    'python-sshtunnel'
    'python-paramiko'
    'python-keyring'
)
optdepends=(
    'python-psycopg2: PostgreSQL and CockroachDB support'
    'python-mysql-connector: MySQL support'
    'python-oracledb: Oracle support'
    'python-mariadb: MariaDB support'
    'python-duckdb: DuckDB support'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/s/sqlit-tui/sqlit_tui-${pkgver}.tar.gz")
sha256sums=('bddae906099afa2937105135242c2f4e2c343e688eb6d3c1267febc87a9370cf')

build() {
    cd "sqlit_tui-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "sqlit_tui-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
