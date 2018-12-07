# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=lib32-jansson
pkgver=2.12
pkgrel=1
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=(x86_64)
url='http://www.digip.org/jansson/'
license=(MIT)
depends=(
  jansson
  lib32-glibc
)
makedepends=(git)
source=(git+https://github.com/akheron/jansson.git#tag=v${pkgver})
sha256sums=(SKIP)

prepare() {
  cd jansson

  autoreconf -fiv
}

build() {
  cd jansson

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C jansson install
  rm -rf "${pkgdir}"/usr/{share,include}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s jansson "${pkgdir}"/usr/share/licenses/lib32-jansson
}

# vim:set ts=2 sw=2 et:
