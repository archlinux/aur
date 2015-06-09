pkgname=php54-xdebug
pkgver=2.2.5
pkgrel=1
pkgdesc="PHP debugging extension (for php54)"
arch=('i686' 'x86_64')
url="http://www.xdebug.org"
license=('GPL')
depends=('php54')
backup=('etc/php/conf.d/xdebug.ini')
conflicts=('xdebug')
provides=('xdebug')
source=("http://xdebug.org/files/xdebug-${pkgver}.tgz" 'xdebug.ini')

build() {
  cd $srcdir/xdebug-$pkgver
  phpize
  ./configure --prefix=/usr --enable-xdebug
  make

  cd debugclient
  ./configure --prefix=/usr
  make
}

package() {
  local PHPVER=`php -r 'echo phpversion();'`

  cd $srcdir/xdebug-$pkgver/debugclient
  make DESTDIR=$pkgdir install

  cd $srcdir/xdebug-$pkgver
  make INSTALL_ROOT=$pkgdir install
  install -D -m 644 $srcdir/xdebug.ini $pkgdir/etc/php/conf.d/xdebug.ini
}

md5sums=('7e571ce8eb6fa969fd8263969019849d'
         '6a1f2ef91c632d4c9b7b218cd2e278ef')
