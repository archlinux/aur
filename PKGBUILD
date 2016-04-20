# Maintainer: Anatol Pomozov anatol dot pomozov at g mail
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: bender02 at archlinux dot us
# Contributor: Felix Saparelli <me@passcod.name>

pkgname=mongoose
pkgver=6.4
pkgrel=1
pkgdesc='Easy to use, powerful, embeddable web server'
arch=(i686 x86_64)
license=(GPL2)
depends=(glibc openssl)
url='https://github.com/cesanta/mongoose'
source=(mongoose-$pkgver.tar.gz::https://github.com/cesanta/mongoose/archive/$pkgver.tar.gz)
sha1sums=('7ed7650db1c5f55b98e577f1abe4378b6b9b9074')

build() {
  cd mongoose-$pkgver
  # hopefully upstream will provdide an official Makefile
  # https://github.com/cesanta/mongoose/issues/326
  gcc -shared -fPIC -DMG_ENABLE_SSL $CFLAGS $LDFLAGS mongoose.c -o libmongoose.so -lssl
}

package() {
  cd mongoose-$pkgver
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 libmongoose.so "$pkgdir/usr/lib/libmongoose.so"
  install -D -m644 mongoose.h "$pkgdir/usr/include/mongoose.h"
}
