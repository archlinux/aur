# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=lib32-jansson
pkgver=2.9
pkgrel=1
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=('x86_64')
url='https://www.digip.org/jansson/'
depends=('jansson' 'lib32-glibc')
makedepends=('gcc-multilib')
license=('MIT')
source=("https://www.digip.org/jansson/releases/jansson-${pkgver}.tar.bz2")
sha256sums=('77094fc1e113da0e2e65479488a0719f859b8f5bde3a6a0da88a1c73a88b5698')

build() {
  cd jansson-${pkgver}

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd jansson-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{share,include}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s jansson "${pkgdir}"/usr/share/licenses/lib32-jansson
}

# vim:set ts=2 sw=2 et:
