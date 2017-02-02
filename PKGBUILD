# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgbase=python-pylibravatar
pkgname=($pkgbase 'python2-pylibravatar')
pkgver=1.7
pkgrel=2
pkgdesc='Python module to make use of the federated Libravatar avatar hosting service'
arch=('any')
url='https://pypi.python.org/pypi/pyLibravatar'
license=('MIT')
makedepends=('python-setuptools' 'python-pydns' 'python2-setuptools' 'python2-pydns')
source=("https://pypi.python.org/packages/18/61/fd748d549be821f6c2ff3f2d1a835d4e2c407431d9372495ec8562242cd1/pyLibravatar-1.7.tar.gz"{,.asc})
sha256sums=('f239caae2aed0e2dcdd695ffcde4572958c001b4bdc464a9291d1b0cae0caa8d' 'SKIP')
validpgpkeys=('8C470B2A0B31568E110D432516281F2E007C98D1') # Francois Marier <fmarier at gmail dot com>

prepare() {
    cp -r pyLibravatar-$pkgver pyLibravatar-$pkgver-python2
}

build() {

    cd $srcdir/pyLibravatar-$pkgver
    python setup.py build

    cd $srcdir/pyLibravatar-$pkgver-python2
    python2 setup.py build

}

package_python-pylibravatar() {

    depends=('python-pydns')

    cd pyLibravatar-$pkgver
    python setup.py install --root $pkgdir --optimize=1

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    tail -n19 $srcdir/pyLibravatar-$pkgver/README.txt > $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-pylibravatar() {

    depends=('python2-pydns')

    cd pyLibravatar-$pkgver-python2
    python2 setup.py install --root $pkgdir --optimize=1

    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    tail -n19 $srcdir/pyLibravatar-$pkgver-python2/README.txt > $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
