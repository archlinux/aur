# Maintainer: Anatol Pomozov anatol dot pomozov at g mail
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: bender02 at archlinux dot us
# Contributor: Felix Saparelli <me@passcod.name>

pkgname=mongoose
pkgver=6.5
pkgrel=1
pkgdesc='Easy to use, powerful, embeddable web server'
arch=(i686 x86_64)
license=(GPL2)
depends=(glibc openssl)
url='https://github.com/cesanta/mongoose'
source=(mongoose-$pkgver.tar.gz::https://github.com/cesanta/mongoose/archive/$pkgver.tar.gz)
sha1sums=('fe065344054498d740a1527b7f291386e1242db3')

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
