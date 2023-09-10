# Maintainer: Stitchless
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.55.1
pkgrel=2
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=(x86_64)
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=(GPL)
makedepends=(cmake ninja)
depends=(fluidsynth fontconfig hicolor-icon-theme lzo nlohmann-json)
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-$pkgver.tar.gz")
b2sums=('6340ebe9c2cc254df5e5612ac3e7c4a861e9fe501842325e1481e9d95e2148755eaef74598727af08c3e47c6a96c9f42506c21347006c682851c47106150d6e5')

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
