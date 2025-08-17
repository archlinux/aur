# Maintainer: Hasan Catalgol <hasancatalgol at gmail.com>

pkgname=python-cloud-sql-python-connector
_pypiname=cloud-sql-python-connector
_srcname=cloud_sql_python_connector
pkgver=1.18.4
pkgrel=1
pkgdesc="Google Cloud SQL Python Connector library"
arch=('any')
url="https://github.com/GoogleCloudPlatform/cloud-sql-python-connector"
license=('Apache-2.0')
depends=(
  'python'
  'python-aiofiles'
  'python-aiohttp'
  'python-cryptography'
  'python-dnspython'
  'python-requests'
  'python-google-auth'
)
makedepends=(
  'python-build'        # PEP 517 build frontend
  'python-installer'    # wheel installer
  'python-wheel'
  'python-setuptools'   # backend used by upstream
)
optdepends=(
  'python-pymysql: MySQL driver (extras: [pymysql])'
  'python-pg8000: PostgreSQL driver (extras: [pg8000])'
  'python-asyncpg: Async PostgreSQL driver (extras: [asyncpg])'
  'python-python-tds: SQL Server driver (extras: [pytds])'
)
source=("${_srcname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_srcname:0:1}/${_srcname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('dd2b015245d77771b5e7566e2817e279e9daca90e0cf30dac032155e813afe76')

build() {
  cd "${_srcname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_srcname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
