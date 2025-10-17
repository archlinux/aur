# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-sqlite3-to-mysql
_pyname='sqlite3_to_mysql'
pkgver=2.5.1
pkgrel=1
pkgdesc='A simple Python tool to transfer data from SQLite 3 to MySQL'
arch=('any')
url='https://pypi.org/project/sqlite3-to-mysql/'
license=('MIT')
depends=('python' 'python-click' 'python-mysql-connector' 'python-pytimeparse2' 'python-dateutil' 'python-simplejson' 'python-tqdm' 'python-packaging' 'python-tabulate' 'python-unidecode' 'python-typing_extensions')
makedepends=('python-setuptools')
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/s/sqlite3-to-mysql/sqlite3_to_mysql-${pkgver}.tar.gz")
sha512sums=('857c83b6e37b5248be3bd5161284c0290adaef1668175b88709715ceb6152f0e2e6f59cb0b75b096866c692116511076a0bd87cc4e09677d0cfdcbe399892a66')

build() {
  cd "$_archive"
  # Tarballs are missing the src folder
  sed -i 's#src/##' pyproject.toml
  python3 -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -I -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
