# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>
# Based on the 'aur/openttd-git' PKGBUILD by McModder <mcmodder@mcmodder.ru>

pkgname=openttd-jgrpp
pkgver=0.41.2
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
makedepends=('cmake' 'tar')
depends=('desktop-file-utils' 'fluidsynth' 'fontconfig' 'hicolor-icon-theme' 'icu' 'libpng' 'lzo' 'sdl2' 'xz')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('a2ff8a5b4d3d6211a61b0ea70912a8a0e6b57fb580a43548639f997247bdf868')

_dirname=OpenTTD-patches-jgrpp

build() {
  cmake \
	-B build \
	-S ${_dirname}-${pkgver} \
	-DBINARY_NAME="${pkgname}" \
	-DCMAKE_INSTALL_BINDIR="bin" \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_DATADIR="share" \
	-DCMAKE_INSTALL_DOCDIR="share/doc/${pkgname}" \
	-DGLOBAL_DIR="/usr/share/${pkgname}" \
	-DPERSONAL_DIR=".${pkgname}"

  make -C build
}

package() {
  make -C build install DESTDIR="${pkgdir}"

  sed -i "s/^Name=OpenTTD$/Name=OpenTTD (JGR Patch Pack)/g" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
