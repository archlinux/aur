# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>
# Based on the 'aur/openttd-git' PKGBUILD by McModder <mcmodder@mcmodder.ru>

pkgname=openttd-jgrpp
pkgver=0.41.0
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
makedepends=('tar' 'cmake')
depends=('libpng' 'sdl2' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'xz' 'fluidsynth')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('3ffd42b99c21f80f5fc1732e06b3d49a31ea5ce0cc73c6d43fea1b4b1ff8c94c')

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
}
