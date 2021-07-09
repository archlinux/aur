# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.42.1
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
makedepends=('cmake' 'sed' 'tar')
depends=('fluidsynth' 'fontconfig' 'freetype2' 'hicolor-icon-theme' 'icu' 'libpng' 'sdl2')
optdepends=('lzo: (de)compressing of old (pre OpenTTD 0.3.0) savegames')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('256f7b5fd5cc94d97eca9752485d632517cbe1c1e38929e51ed83a7215824ffd')

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
