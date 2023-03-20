# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by Vesa Kaihlavirta <vegai@iki.fi>, Alexander F. Rødseth <xyproto@archlinux.org>, and Laurent Carlier <lordheavym@gmail.com>

pkgname=openttd-jgrpp
pkgver=0.52.0
pkgrel=1
pkgdesc="Engine for running Transport Tycoon Deluxe with JGR's patch pack"
arch=(x86_64)
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=(GPL)
makedepends=(cmake ninja)
depends=(fluidsynth fontconfig hicolor-icon-theme lzo)
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-$pkgver.tar.gz")
b2sums=('15557e3a3760054ab836bea71ceb80fb0cf49b04ccae616daebaf0cdc7c132d389969e11159c89b998287439aeac17ba7df5afe1ae4b0b31962a21f699a58496')

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
    -S $_dirname-$pkgver

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  sed -i "s/^Name=OpenTTD$/Name=OpenTTD (JGR Patch Pack)/g" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
