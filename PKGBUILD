# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=lib32-jansson
pkgver=2.11
pkgrel=1
pkgdesc='C library for encoding, decoding and manipulating JSON data'
arch=('x86_64')
url='http://www.digip.org/jansson/'
depends=('jansson' 'lib32-glibc')
makedepends=('gcc-multilib')
license=('MIT')
source=("http://www.digip.org/jansson/releases/jansson-${pkgver}.tar.bz2"{,.asc})
sha256sums=('783132e2fc970feefc2fa54199ef65ee020bd8e0e991a78ea44b8586353a0947'
            'SKIP')
validpgpkeys=('B5D6953E6D5059ED7ADA0F2FD3657D24D058434C') # Petri Lehtinen <petri@digip.org>

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
