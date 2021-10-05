# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.43.1
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
makedepends=('cmake')
depends=('fluidsynth' 'fontconfig' 'freetype2' 'hicolor-icon-theme' 'icu' 'libpng' 'sdl2')
optdepends=('lzo: (de)compressing of old (pre OpenTTD 0.3.0) savegames')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('8468ead82eaab20a0960e1081f337fab67cfd9d75fc127fb9e399aa59c2151ed')

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
