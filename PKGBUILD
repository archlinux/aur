# Maintainer: Peter <peter.w.adams96@gmail.com>
pkgname=python-sqlit-tui
pkgver=1.1.4
pkgrel=1
pkgdesc="The lazygit of SQL databases - a lightweight TUI for SQL Server, PostgreSQL, MySQL, SQLite, and more"
arch=('any')
url="https://github.com/Maxteabag/sqlit"
license=('MIT')
depends=(
    'python>=3.10'
    'python-textual>=6.10.0'
    'python-textual-fastdatatable>=0.14.0'
    'python-pyperclip>=1.8.2'
    'python-keyring>=24.0.0'
    'python-docker>=7.0.0'
)
optdepends=(
    'python-psycopg2: PostgreSQL, CockroachDB and Supabase support'
    'python-pyodbc: SQL Server support'
    'python-mysql-connector: MySQL support'
    'python-mariadb-connector: MariaDB support'
    'python-oracledb: Oracle support'
    'python-duckdb: DuckDB support'
    'python-clickhouse-connect: ClickHouse support'
    'python-requests: Cloudflare D1 support'
    'python-snowflake-connector-python: Snowflake support'
    'python-paramiko: SSH tunnel support'
    'python-sshtunnel: SSH tunnel support'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/s/sqlit-tui/sqlit_tui-${pkgver}.tar.gz")
sha256sums=('05303cebe56c53a452622aced97b66e19af9bcde1b6cdb27d78de66c43a09edb')

build() {
    cd "sqlit_tui-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "sqlit_tui-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
