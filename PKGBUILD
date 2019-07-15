# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgname=python-demjson-git
pkgver=r41.5bc6597
pkgrel=1
pkgdesc='Python module for JSON data encoding, including jsonlint.'
arch=('any')
url='https://github.com/dmeranda/demjson'
license=('LGPL3')

provides=('python-demjson' 'python2-demjson')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')

source=('git+https://github.com/dmeranda/demjson')
sha512sums=('SKIP')

prepare() {
    cp -a $srcdir/demjson{,-py2}
}

build() {
    cd $srcdir/demjson
    2to3 -w .
    python setup.py build

    cd $srcdir/demjson-py2
    python2 setup.py build
}

check() {
    cd $srcdir/demjson
    PYTHONPATH=. pytest

    cd $srcdir/demjson-py2
    PYTHONPATH=. pytest2
}

package_python-demjson-git() {
    depends=('python')
    cd $srcdir/demjson
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-demjson-git() {
    depends=('python2')
    cd $srcdir/demjson-py2
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
