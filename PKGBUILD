# Maintainer: golfiros <gabriel.golfetti@gmail.com>
# Contributor: neolouker <neolouker@gmail.com>
# Contributor: Konqueror <@Konqueror@mastodon.world>
# Contributor: Anthony Wang <ta180m at pm dot me> 
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Anatol Pomozov anatol dot pomozov at g mail
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: bender02 at archlinux dot us
# Contributor: Felix Saparelli <me@passcod.name>

pkgname=mongoose
pkgver=7.20
pkgrel=1
pkgdesc="Easy to use, powerful, embeddable web server"
arch=(any)
license=('GPL-2.0-only OR custom:mongoose')
depends=('openssl')
url="https://github.com/cesanta/mongoose"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cesanta/mongoose/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('a96716ddb4bd8d5b5b64cebc06b3e43be849ed760654957b09a4be9e3dbd8776ec20e6918065a5651d471d284f0ecd135b5f8037313011317921d6f846b6c031')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/test"
  SSL=OPENSSL make linux-libs
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "test/libmongoose.so.${pkgver}" "${pkgdir}/usr/lib/libmongoose.so"
  install -Dm644 mongoose.h "${pkgdir}/usr/include/mongoose.h"
}
