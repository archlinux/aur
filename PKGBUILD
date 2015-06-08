# Maintainer: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# Contributor: Lisa Denia <eiffel56@gmail.com>

pkgname=ganyremote
pkgver=6.3.3
pkgrel=1
pkgdesc="GTK frontend for anyremote."
arch=('i686' 'x86_64')
url="http://anyremote.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-pybluez' 'pygtk' 'anyremote>=6.3')
source=(http://downloads.sourceforge.net/sourceforge/anyremote/$pkgname-$pkgver.tar.gz)
md5sums=('3541cd3c278e3887b1c5273563a4403e')

build() {
  cd $srcdir/$pkgname-$pkgver

  export PYTHON="python2"

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  sed -i -e 's:\(#!/usr/bin/env[ ]\+python$\|#!/usr/bin/python$\|\"python\):\12:g' $pkgdir/usr/bin/ganyremote
}
