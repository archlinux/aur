# Maintainer: Padfoot <padfoot at exemail dot com dot au>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libvisual
pkgver=0.4.0
pkgrel=3
pkgdesc='Abstraction library that comes between applications and audio visualisation plugins'
arch=('x86_64')
url='http://sourceforge.net/projects/libvisual/'
license=('LGPL')
depends=('lib32-glibc' 'libvisual')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/libvisual/libvisual-${pkgver}.tar.gz")
sha256sums=('0b4dfdb87125e129567752089e3c8b54cefed601eef169d2533d8659da8dc1d7')

build() {
  cd libvisual-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd libvisual-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
