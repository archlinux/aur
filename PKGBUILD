# Maintainer: bunburya (dev at bunburya dot eu))
pkgname='python-piecash'
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python library providing a simple and pythonic interface to GnuCash files stored in SQL."
arch=('any')
url="https://pypi.org/project/piecash/"
license=('MIT')
depends=(
    'python'
    'python-sqlalchemy1.3'
    'python-sqlalchemy-utils'
    'python-pytz'
    'python-tzlocal'
    'python-click'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner')
optdepends=(
    'gnucash: to create, view and edit GnuCash files'
    'python-pandas: view data in Pandas DataFrame'
    'python-psycopg2: postgresql support'
    'python-pymysql: MySQL support'
    'python-requests: retrieve quotes/prices from Yahoo Finance'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('89639f0661d492242783f39c8d147ea45c321dc4111f93eca2979f070f5f176d')

check() {
    cd "$_name-$pkgver"
    python setup.py pytest
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
