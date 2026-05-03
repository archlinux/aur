# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=asroot-libpassphrase
pkgver=1.1.12
pkgrel=1
pkgdesc="A simpler alternative to sudo and doas, libpassphrase version"
arch=(x86_64 aarch64)
url="https://codeberg.org/maandree/asroot"
license=('custom:ISC')
depends=(libpassphrase libenv)
makedepends=(sed)
conflicts=(asroot)
provides=(asroot)
source=(asroot-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(af8f4f5b82f1dfa6461950b9e47e4bafc5bc9b3e0a9f2f3cc7c8801c4d8ab827)

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
