# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: farid abdelnour <farid at atelier-labs.org>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail.org>

pkgname=lib32-twolame
_pkgname=twolame
pkgver=0.3.13
pkgrel=3
pkgdesc="An optimized MPEG Audio Layer 2 (MP2) encoder (32-bit)"
arch=('i686' 'x86_64')
url="http://www.twolame.org/"
license=('LGPL')
depends=('libsndfile')
source=("https://github.com/njh/twolame/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4113d8aa80194459b45b83d4dbde8ddb')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR=${pkgdir} install
  rm -rf "$pkgdir"/usr/{bin,include,share}
}
