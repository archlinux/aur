# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

_pkgbasename=openal
pkgname=lib32-$_pkgbasename
pkgver=1.17.0
pkgrel=2
pkgdesc="A cross-platform 3D audio library (32-bit)"
arch=(x86_64)
url="http://www.openal.org/"
license=(LGPL)
depends=(lib32-glibc $_pkgbasename)
makedepends=(lib32-alsa-lib pkgconfig cmake lib32-libpulse lib32-portaudio lib32-jack
             git gcc-multilib)
_commit=63567526b0a17449baf57053d11688aa277a7e40
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  mkdir build
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIB_SUFFIX=32 ../openal-soft
  make
}

package() {
  make -C build DESTDIR="$pkgdir/" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
