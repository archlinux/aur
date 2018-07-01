# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: farid abdelnour <farid at atelier-labs.org>
# Contributor: Gustavo Alvarez <sl1pkn07 at gmail.org>

pkgname=lib32-twolame
_pkgbasename=twolame
pkgver=0.3.13
pkgrel=1
pkgdesc="An optimized MPEG Audio Layer 2 (MP2) encoder (32-bit)"
arch=('x86_64')
url="http://www.twolame.org/"
license=('LGPL')
depends=('lib32-libsndfile' 'twolame')
source=("https://downloads.sourceforge.net/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('241ae5faebf05cb919959bb0545cb89e9b71cfb07f92a7118d864499ea4f0065ddaa646ab1482ffbcbca427d52c2436764074bd67fd19a1eb9979987f23163f7')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}-${pkgver}"

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --disable-static
  make
}

package() {
  cd "${_pkgbasename}-${pkgver}"

  make DESTDIR=${pkgdir} install
  
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
