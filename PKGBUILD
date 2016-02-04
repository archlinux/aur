pkgname=php-inotify
pkgver=2.0.0
pkgrel=1
pkgdesc="Inotify bindings for PHP 5 and PHP 7."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/inotify"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/inotify.ini')
source=(http://pecl.php.net/get/inotify-$pkgver.tgz)
sha256sums=('d044a89d26bbaa110f34f182b1c92ab5eb09768096bacf3d837d7e49ac045107')

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
