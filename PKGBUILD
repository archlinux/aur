# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: oi_wtf <brainpower@mailbox.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi@archlinux.us>

pkgname=lib32-libsodium
pkgver=1.0.18
pkgrel=2
pkgdesc='A modern, portable, easy to use crypto library'
arch=(x86_64)
url='https://github.com/jedisct1/libsodium'
license=(custom:ISC)
depends=(
  lib32-glibc
  libsodium
)
makedepends=(git)
source=(git+https://github.com/jedisct1/libsodium.git#tag=${pkgver})
sha256sums=(SKIP)

prepare() {
  cd libsodium

  ./autogen.sh
}

build() {
  cd libsodium

  export CC='gcc -m32'
  export PKG_CONFIG_LIBDIR=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd libsodium

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,lib,include,share}}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libsodium "${pkgdir}"/usr/share/licenses/lib32-libsodium
}

# vim:set ts=2 sw=2 et:
