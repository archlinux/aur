# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

_pkgbasename=openal
pkgname=lib32-$_pkgbasename
pkgver=1.15.1
pkgrel=2
pkgdesc="A cross-platform 3D audio library (32-bit)"
arch=(x86_64)
url="http://www.openal.org/"
license=(LGPL)
depends=(lib32-glibc $_pkgbasename)
makedepends=(lib32-alsa-lib lib32-sdl lib32-libpulse pkgconfig cmake gcc-multilib)
source=(http://kcat.strangesoft.net/openal-releases/openal-soft-$pkgver.tar.bz2)
md5sums=('ea83dec3b9655a27d28e7bc7cae9cd71')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $_pkgbasename-soft-$pkgver/build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIB_SUFFIX=32 ..
  make
}

package() {
  cd $_pkgbasename-soft-$pkgver
  make -C build DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir"/usr/{include,share,bin}
}
