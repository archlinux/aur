# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.56.0
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=(x86_64)
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=(GPL)
makedepends=(cmake ninja)
depends=(fluidsynth fontconfig hicolor-icon-theme lzo nlohmann-json)
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-$pkgver.tar.gz")
b2sums=('81b71c02900779f28eaf5844e75d180e5ee71a0862a13cd674e246b04892181ce7412c480b575fce01b20a4dd02417026b7309fbd779814468395fea2a84d3e4')

_dirname=OpenTTD-patches-jgrpp

build() {
  cmake \
    -B build \
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
