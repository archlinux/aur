# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=p4a-build
pkgname=(python-$_pkgname python2-$_pkgname)
pkgver=1.0.1
pkgrel=1
url="http://android.kivy.org/"
license=('LGPL3')
arch=('any')
source=("https://pypi.python.org/packages/source/p/p4a-build/p4a-build-$pkgver.tar.gz")
md5sums=('dcc80488b70bf27544e3ccafca95ef61')


prepare() {
   cp -r $_pkgname-${pkgver} python2-$_pkgname-${pkgver}
}

build() {
   cd $srcdir/$_pkgname-${pkgver}
   2to3 -w --no-diffs p4a-build
   python setup.py build

   cd $srcdir/python2-$_pkgname-${pkgver}
   sed -i -e 's|env python$|env python2|' p4a-build
   python2 setup.py build
}

package_python-p4a-build() {
    pkgdesc="Build tool for the P4A (Python for Android) build cloud"
    depends=('python' 'python-requests')

    cd $srcdir/$_pkgname-$pkgver
    install -Dm755 p4a-build "$pkgdir/usr/bin/p4a-build"
}

package_python2-p4a-build() {
    pkgdesc="Build tool for the P4A (Python for Android) build cloud"
    depends+=('python2' 'python2-requests')

    cd $srcdir/python2-$_pkgname-$pkgver
    install -Dm755 p4a-build "$pkgdir/usr/bin/p4a-build2"
}
