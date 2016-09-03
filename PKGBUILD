# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
pkgver=0.20.0
pkgrel=5
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('custom:BSD 2-clause')
groups=('devel')
depends=('freetype2>=2.3.5' 'boost-libs>=1.42')
makedepends=('cmake>=2.8' 'unittestpp' 'boost>=1.42')
_vcsname=lomse

source=("https://codeload.github.com/lenmus/lomse/tar.gz/${pkgver}")
md5sums=('76c8dc0ab0d3d00d76908c30e5a5c4c9')

build() {
  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "../${_vcsname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}/" make install

  install -D -m644 "${srcdir}/${_vcsname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
