# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=extremetuxracer
pkgver=0.8.3
pkgrel=2
pkgdesc="Downhill racing game starring Tux"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname}"
license=(GPL)
depends=(sfml glu freetype2)
makedepends=(csfml)
source=(https://downloads.sourceforge.net/${pkgname}/etr-${pkgver}.tar.xz)
sha512sums=('75b6f2b4d7260216fb8b5bee1412ed929712e6de04a3b32ecf65ad747c6bff30e5eb5bedde24dca0afaec816c847860d9c589c66cdff08aa4bdcec224e727f1f')

prepare() {
  # Work-around for SFML 2.6.0-1.
  # https://bugs.archlinux.org/task/78854
  if [ -d '/usr/pkgconfig/' ]; then
    export PKG_CONFIG_PATH='/usr/pkgconfig/'
  fi
}

build() {
  cd etr-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd etr-${pkgver}
  make check
}

package() {
  cd etr-${pkgver}
  make DESTDIR="${pkgdir}" install
}
