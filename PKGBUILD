# Maintainer: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# Contributor: Lisa Denia <eiffel56@gmail.com>

pkgname=kanyremote
pkgver=6.3.5
pkgrel=1
pkgdesc="KDE-frontend for anyremote."
arch=('i686' 'x86_64')
url="http://anyremote.sourceforge.net"
license=('GPL')
makedepends=('automake>=1.10' 'autoconf>=2.62')
depends=('python2-pybluez' 'anyremote>=6.3' 'kdebindings-python2')
source=(http://downloads.sourceforge.net/sourceforge/anyremote/$pkgname-$pkgver.tar.gz)
md5sums=('564c2bd86a94f75d03ba386f65567ffa')

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
