pkgname=php-inotify
pkgver=0.1.6
pkgrel=1
pkgdesc="The inotify extension allows to use inotify functions in a PHP script."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/inotify"
license=('PHP')
depends=('php')
backup=('etc/php/conf.d/inotify.ini')
source=(http://pecl.php.net/get/inotify-$pkgver.tgz)
sha256sums=('979f80a25d4eb0de282617ffc0df46f07346a8383f310b9b943e48992e5b494e')

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
