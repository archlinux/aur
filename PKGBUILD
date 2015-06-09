# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=concoord
pkgver=1.1.0
pkgrel=1
pkgdesc="Coordination service for distributed systems"
arch=('any')
depends=('python2' 'python2-dnspython' 'python2-msgpack')
makedepends=('python2-distribute')
url="https://github.com/denizalti/concoord"
license=('BSD')
source=(http://openreplica.org/src/$pkgname-$pkgver.tar.gz)
sha256sums=('fff6f4b669867f0b2ba3469a03497ac5e656292bfcf35412e353c8be48983e25')
provides=('concoord' 'openreplica')
conflicts=('openreplica')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd $srcdir/$pkgname-$pkgver

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
