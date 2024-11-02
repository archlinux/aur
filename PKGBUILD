# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.63.0
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=(x86_64)
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=(GPL-3.0-only)
makedepends=(cmake ninja)
depends=(fluidsynth fontconfig hicolor-icon-theme lzo)
options=(!debug !lto)
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-$pkgver.tar.gz")
b2sums=('54f21d9fed27e1f2091249711521d53b07d16a285b570529e5030f78009a5a29b33e57f68db321e70cd87638c07ddac6f19fc93dd3420a42054c28fcae0ff871')

_dirname=OpenTTD-patches-jgrpp

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D BINARY_NAME="$pkgname" \
    -D CMAKE_INSTALL_BINDIR="bin" \
    -D CMAKE_INSTALL_DATADIR="/usr/share" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D PERSONAL_DIR=".$pkgname" \
    -G Ninja \
    -S "$_dirname-$pkgver"

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  sed -i "s|^Name=OpenTTD+JGRPP$|Name=OpenTTD (JGR Patch Pack)|g" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
