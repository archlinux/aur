# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=asroot-libpassphrase
pkgver=1.1.6
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas, libpassphrase version"
arch=('x86_64')
url="https://codeberg.org/maandree/asroot"
license=('custom:ISC')
depends=(libpassphrase)
makedepends=(sed)
conflicts=(asroot)
provides=(asroot)
source=(asroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(80fdb7abb4cd470fb8f8c6ac1b45a218afed8061c5f560d8907896ca5a833f61)

prepare() {
  cd "${srcdir}/asroot"
  sed '/CPPFLAGS/s/$/ -DWITH_LIBPASSPHRASE/' < config.mk > config.mk.tmp
  sed '/LDFLAGS/s/$/ -lpassphrase/' < config.mk.tmp > config.mk
}

build() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package() {
  cd "${srcdir}/asroot"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  make DESTDIR="${pkgdir}/" PREFIX=/usr post-install
}
