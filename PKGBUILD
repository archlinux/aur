# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-pyuca
pkgname=($pkgbase 'python2-pyuca')
pkgver=1.2
pkgrel=1
pkgdesc='Python implementation of the Unicode Collation Algorithm (UCA)'
arch=('any')
url='https://github.com/jtauber/pyuca'
license=('MIT' 'custom')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41a47aa598c152a52b1dc4aa210c6db62cc7f72d13cee2caee80841c3cc49e19')

prepare() {
    cp -r pyuca-$pkgver pyuca-$pkgver-python2
}

build() {

    cd $srcdir/pyuca-$pkgver
    python setup.py build

    cd $srcdir/pyuca-$pkgver-python2
    python2 setup.py build

}

package_python-pyuca() {

    cd pyuca-$pkgver
    python setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/pyuca-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    echo '' >> $pkgdir/usr/share/licenses/$pkgname/LICENSE
    cat $srcdir/pyuca-$pkgver/LICENSE-allkeys >> $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-pyuca() {

    cd pyuca-$pkgver-python2
    python2 setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/pyuca-$pkgver-python2/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    echo '' >> $pkgdir/usr/share/licenses/$pkgname/LICENSE
    cat $srcdir/pyuca-$pkgver-python2/LICENSE-allkeys >> $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
