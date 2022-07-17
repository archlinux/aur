# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=asroot-libpassphrase
pkgver=1.1.6
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas, libpassphrase version"
arch=('x86_64')
url="https://github.com/maandree/asroot"
license=('custom:ISC')
depends=(libpassphrase)
makedepends=(sed)
conflicts=(asroot)
provides=(asroot)
source=(asroot-$pkgver.tar.gz::https://github.com/maandree/asroot/archive/${pkgver}.tar.gz)
sha256sums=(e7a402f424b57a12d937138eae20e7dc9e3cbb46ece551037ab65d45aad7c4fd)

prepare() {
  cd "${srcdir}/asroot-${pkgver}"
  sed '/CPPFLAGS/s/$/ -DWITH_LIBPASSPHRASE/' < config.mk > config.mk.tmp
  sed '/LDFLAGS/s/$/ -lpassphrase/' < config.mk.tmp > config.mk
}

build() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot-${pkgver}"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
