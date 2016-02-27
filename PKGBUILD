# Maintainer: Uwe Koloska <kolewu@koloro.de>

pkgname=liblomse
pkgver=0.17
pkgrel=4
pkgdesc="A music score renderization/edition library"
arch=('i686' 'x86_64')
url="http://www.lenmus.org/en/lomse/intro"
license=('custom:BSD 2-clause')
groups=('devel')
depends=('freetype2>=2.3.5' 'boost-libs>=1.42')
makedepends=('cmake>=2.8' 'unittestpp' 'boost>=1.42')
_vcsname=lomse

source=("https://codeload.github.com/lenmus/lomse/tar.gz/${pkgver}"
       CMakeLists_version.patch)
md5sums=('60f990492a5cccffa815e2c5bf29c517'
         '3720545fd4350dbd01f8b48958bf9ff8')

prepare() {
  cd "$srcdir/${_vcsname}-${pkgver}"
  patch -p0 -i "$srcdir"/CMakeLists_version.patch
}

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

  install -D -m644 "${srcdir}/${_vcsname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
