# Maintainer: edubart <edub4rt@gmail.com>
pkgname=openal-static
pkgver=1.18.2
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(i686 x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(glibc)
makedepends=(alsa-lib pkgconfig cmake libpulse qt4 fluidsynth portaudio jack sdl2 sdl_sound ffmpeg
             git)
_commit=ce6076091bac3c00cd10803916e8911495580bd0  # tags/openal-soft-1.18.2
source=("git+https://github.com/kcat/openal-soft#commit=$_commit")
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
