# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>
# Contributor: Tod Jackson <tod.jackson@gmail.com>

pkgname=lib32-libbsd
pkgver=0.10.0
pkgrel=1
pkgdesc='Provides useful functions commonly found on BSD systems like strlcpy()'
arch=('x86_64')
url='http://libbsd.freedesktop.org'
license=('custom')
depends=('lib32-glibc' 'libbsd')
makedepends=('gcc-multilib')
source=("https://libbsd.freedesktop.org/releases/libbsd-${pkgver}.tar.xz")
sha256sums=('34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887')

build() {
  cd libbsd-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd libbsd-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share/man}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libbsd "${pkgdir}"/usr/share/licenses/lib32-libbsd
}

# vim:set ts=2 sw=2 et:
