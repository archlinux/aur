# Maintainer: a821
# Contributor: Lex Black <autumn-wind - web - de>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>

pkgname=python-ipython-sql
pkgver=0.4.0
pkgrel=1
pkgdesc="RDBMS access via IPython"
arch=('any')
url="https://pypi.python.org/pypi/ipython-sql"
license=('MIT')
depends=('ipython' 'python-sqlalchemy' 'python-prettytable' 'python-sqlparse' 'python-six')
source=("https://files.pythonhosted.org/packages/source/i/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('3e888e59bf57277cbd6f383cb232858b2d7c71219e5749257128f16d9857e46c')
optdepends=(
    'python-pandas: DataFrame support'
    'python-pymysql: connect to MySQL database'
    'python-psycopg2: connect to PostgreSQL database')

prepare() {
    # fix missing file
    cd "${pkgname#python-}-${pkgver}"
    test -f NEWS.rst || touch NEWS.rst
}

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
