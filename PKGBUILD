# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# Contributor: Lisa Denia <eiffel56@gmail.com>

pkgname=kanyremote
pkgver=8.0
pkgrel=1
pkgdesc="KDE-frontend for anyremote."
arch=('i686' 'x86_64')
url="http://anyremote.sourceforge.net"
license=('GPL')
makedepends=('automake>=1.10' 'autoconf>=2.62')
depends=('python2-pybluez' 'anyremote>=6.3' 'kdebindings-python2')
source=(https://downloads.sourceforge.net/sourceforge/kanyremote/$pkgname-$pkgver.tar.gz)
sha256sums=('348f70639fe8f8047717a08cd0b340f8d65e77787e8dc056d29bc4e743f8116d')

build() {
  cd $srcdir/$pkgname-$pkgver

  export PYTHON="python2"

  ./configure  --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  sed -i -e 's:\(#!/usr/bin/env[ ]\+python$\|#!/usr/bin/python$\|\"python\):\12:g' $pkgdir/usr/bin/kanyremote
}
