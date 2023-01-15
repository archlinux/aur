# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.3.11.1
pkgrel=6
pkgdesc="Module player library supporting many formats, including MOD, S3M, IT and XM (32-bit)"
url="http://mikmod.sourceforge.net"
license=(
  GPL2
  LGPL2.1
)
arch=(x86_64)
depends=(
  lib32-glibc
  lib32-libpulse
  libmikmod
)
makedepends=(
  lib32-alsa-lib
  cmake
  ninja
)
provides=(libmikmod.so)
source=(https://downloads.sourceforge.net/mikmod/libmikmod-$pkgver.tar.gz)
md5sums=('f69d7dd06d307e888f466fc27f4f680b')
sha256sums=('ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19')

prepare() {
  cd libmikmod-$pkgver
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  cmake -S libmikmod-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DLIB_SUFFIX=32 \
    -DENABLE_DL=1
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/{bin,include}
}

# vim:set sw=2 sts=-1 et:
