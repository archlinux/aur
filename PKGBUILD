# Maintainer: neolouker <neolouker@gmail.com>
# Contributor: Konqueror <@Konqueror@mastodon.world>
# Contributor: Anthony Wang <ta180m at pm dot me> 
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Anatol Pomozov anatol dot pomozov at g mail
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: bender02 at archlinux dot us
# Contributor: Felix Saparelli <me@passcod.name>

pkgname=mongoose
pkgver=7.16
pkgrel=1
pkgdesc="Easy to use, powerful, embeddable web server"
arch=(any)
license=('GPL-2.0-or-later')
depends=('openssl')
url="https://github.com/cesanta/mongoose"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cesanta/mongoose/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('46f56e67db6c0ed75e1a39ce9f6e9e23bbb82bb8fa10aa63a4477fcf66246c5b225a1a950f11e11f95cedb5d080af78bdbfcf2562696a0d78981d2df080b34f6')

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
