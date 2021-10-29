# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.43.2
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
makedepends=('cmake')
depends=('fluidsynth' 'fontconfig' 'freetype2' 'hicolor-icon-theme' 'lzo')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('b2b2d11eebb915f2082634e1e43acbbf24b5919e2ca977d4805e8fae73dcf6c1')

_dirname=OpenTTD-patches-jgrpp

build() {
  cmake \
    -B build \
    -S ${_dirname}-${pkgver} \
    -D BINARY_NAME="${pkgname}" \
    -D CMAKE_INSTALL_BINDIR="bin" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D CMAKE_INSTALL_DATADIR="/usr/share" \
    -D PERSONAL_DIR=".${pkgname}"

  make -C build
}

package() {
  make -C build install DESTDIR="${pkgdir}"

  sed -i "s/^Name=OpenTTD$/Name=OpenTTD (JGR Patch Pack)/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
