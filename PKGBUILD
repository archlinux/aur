# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=asroot-libpassphrase
pkgver=1.1
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
sha256sums=(6ca561f8ee625648adc315db8aab401bc19ad7f74c2db836e2a4f5dd559cb5f9)

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
