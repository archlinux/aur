# Maintainer: edubart <edub4rt@gmail.com>
pkgname=openal-static
pkgver=1.21.1
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(i686 x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(glibc)
makedepends=(alsa-lib pkgconfig cmake libpulse fluidsynth portaudio jack sdl2 ffmpeg git)
source=("git+https://github.com/kcat/openal-soft#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  mkdir build
  cd openal-soft
}

build() {
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIBTYPE=STATIC -D ALSOFT_EXAMPLES=OFF -D ALSOFT_UTILS=OFF -D ALSOFT_TESTS=OFF ../openal-soft
  make
}

package() {
  install -Dm0644 build/libopenal.a "$pkgdir/usr/lib/libopenal.a"
}
