# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Eric Belanger <eric.archlinux.org>
# Contributor: Fabio Scotoni <CCuleX.gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=extremetuxracer
pkgver=0.8.4
pkgrel=2
pkgdesc="Downhill racing game starring Tux"
arch=(x86_64)
url="https://sourceforge.net/projects/${pkgname}"
license=(GPL-2.0-or-later)
depends=(sfml glu freetype2)
makedepends=(csfml)
source=(https://downloads.sourceforge.net/${pkgname}/etr-${pkgver}.tar.xz
  sfml3.patch::https://github.com/jcowgill/${pkgname}/commit/5823ba6c18432e083ec103ce74921270d7e071d6.patch)
sha512sums=('65d54bfef59cf83eec9ee761ac24c728d3118cf47105920f22057b59425eba65e03967196d4a93039f30b9420e67b10f296ec7deed7e506ad78c7bb5ce5ed0d2'
            '03611b50e68da054bba3439071bb52b2b6e2aae1728a5231da53301cfa66ab49177cc4aee85caf59f0d9dd9e6ff87ee7c7b2212c57b935ff40b8cac9056e1d83')

prepare() {
  cd etr-${pkgver}
  # https://github.com/jcowgill/extremetuxracer/pull/1
  patch -p1 -i ../sfml3.patch
  sed -i 's/c++14/c++17/' configure.ac
}

build() {
  cd etr-${pkgver}
  ./autogen.sh
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
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
