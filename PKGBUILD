# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: farid abdelnour <farid at atelier-labs.org>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail.org>

pkgname=lib32-twolame
pkgver=0.4.0
pkgrel=2
pkgdesc="An optimized MPEG Audio Layer 2 (MP2) encoder (32-bit)"
arch=('x86_64')
url="http://www.twolame.org/"
license=('LGPL')
depends=('lib32-glibc' 'twolame')
makedepends=('lib32-libsndfile')
provides=('libtwolame.so')
source=("https://github.com/njh/twolame/releases/download/${pkgver}/twolame-${pkgver}.tar.gz")
sha512sums=('cc594bc8d2322922280f915a3c0aa52540cca0350d6498bc96f3f60fd6e53f951e775ea015a44bdb29ec883b46b31a0e5483f6a5c188b02e30008289273c7d03')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd twolame-${pkgver}

  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-static
  make
}

package() {
  cd twolame-${pkgver}

  make DESTDIR="${pkgdir}" install
  
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
