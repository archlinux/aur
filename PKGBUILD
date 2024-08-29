# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Konqueror <@Konqueror@mastodon.world>
# Contributor: Anthony Wang <ta180m at pm dot me> 
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Anatol Pomozov anatol dot pomozov at g mail
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: bender02 at archlinux dot us
# Contributor: Felix Saparelli <me@passcod.name>

pkgname=mongoose
pkgver=7.15
pkgrel=1
pkgdesc="Easy to use, powerful, embeddable web server"
arch=(any)
license=('GPL-2.0-or-later')
depends=('openssl')
url="https://github.com/cesanta/mongoose"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cesanta/mongoose/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9d7edd3b3e7fb74769cffcaf52f12cd81a83510904d581effec962a7a935603cd3a9270fe589ff1ae5c7874a5707edb756baf5afd2459b5dc93f9f6e5d89b027')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # hopefully upstream will provdide an official Makefile
  # https://github.com/cesanta/mongoose/issues/326
  gcc -shared -fPIC -DMG_ENABLE_SSL $CFLAGS $LDFLAGS mongoose.c -o libmongoose.so -lssl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 libmongoose.so "${pkgdir}/usr/lib/libmongoose.so"
  install -Dm644 mongoose.h "${pkgdir}/usr/include/mongoose.h"
}
