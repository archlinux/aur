pkgname=php-inotify
pkgver=3.0.0
pkgrel=1
pkgdesc="Inotify bindings for PHP 5 and PHP 7."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/inotify"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/inotify.ini')
source=(http://pecl.php.net/get/inotify-$pkgver.tgz)
sha256sums=('c71b78644c0115579cc794f58e78441441751d78040b9d9d1a223d3e9c2d723d')

build() {
  cd "$srcdir/inotify-$pkgver"

  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/inotify-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=inotify.so' > inotify.ini
  install -Dm644 inotify.ini "$pkgdir/etc/php/conf.d/inotify.ini"
}

# vim:set ts=2 sw=2 et:
