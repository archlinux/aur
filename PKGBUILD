# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-aiomysql
pkgver=0.0.7
pkgrel=1
_pymysqlver=0.6.7
pkgdesc="MySQL driver for asyncio"
arch=(any)
url="http://aiomysql.readthedocs.org/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("http://pypi.python.org/packages/source/a/aiomysql/aiomysql-$pkgver.tar.gz"
        "http://pypi.python.org/packages/source/P/PyMySQL/PyMySQL-$_pymysqlver.tar.gz")

prepare() {
    cd "$srcdir"/aiomysql-$pkgver
    mv "$srcdir"/PyMySQL-$_pymysqlver/pymysql aiomysql/
    rm -rf aiomysql/pymysql/tests
    sed 's/from pymysql/from .pymysql/' -i aiomysql/*.py
    sed 's/from pymysql /from . /' -i aiomysql/pymysql/*.py
}

build() {
    cd "$srcdir"/aiomysql-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/aiomysql-$pkgver
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('2433bd05ba416a88e190ea37a0e5e5f49b7e1b1bb1651089cc23ac6f2e9cc0e4'
            'e549649db3b1a9317c6027175197458bfb4f55357828410ed4f768fc6ce35f0f')
