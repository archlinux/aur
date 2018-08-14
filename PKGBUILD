# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=('python-fitparse-git' 'python2-fitparse-git')
_pkgbase="python-fitparse"
pkgver=v1.0.1.r9.3fa1fc0
pkgrel=1
pkgdesc="A Python library to parse ANT/Garmin .FIT files"
arch=('any')
url="https://github.com/dtcooper/python-fitparse"
license=('custom')
depends=()
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=('python-fitparse::git+https://github.com/dtcooper/python-fitparse')
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgbase
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    cp -a $srcdir/$_pkgbase{,-py2}
}

build() {
    cd $srcdir/$_pkgbase
    python setup.py build

    cd $srcdir/$_pkgbase-py2
    python2 setup.py build
    mv ./build/scripts-2.7/fitdump{,2}
}

package_python-fitparse-git() {
    depends=(python)
    cd $srcdir/$_pkgbase
    python setup.py install --root=$pkgdir/ --optimize=1 --skip-build
    install -Dm644 $srcdir/$_pkgbase/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-fitparse-git() {
    depends=(python2)
    cd $srcdir/$_pkgbase-py2
    python2 setup.py install --root=$pkgdir/ --optimize=1 --skip-build
    install -Dm644 $srcdir/$_pkgbase/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
