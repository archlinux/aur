# Maintainer: steelt <steeltitanium1 at gmail dot com>
# Contributor: steelt <steeltitanium1 at gmail dot com>

pkgname=ringracers
pkgver=2.0
_dataver=2.0
pkgrel=1
pkgdesc="Kart racing video game originally based on the 3D Sonic the Hedgehog fangame Sonic Robo Blast 2"
arch=('x86_64' 'aarch64')
license=('GPL2')
url='https://www.kartkrew.org'
depends=("ringracers-data>=$_dataver" 'curl' 'zlib' 'libpng' 'libvorbis' 'libvpx' 'libyuv' 'sdl2')
makedepends=('git' 'cmake' 'ninja')

source=("$pkgname"::"git+https://github.com/KartKrewDev/RingRacers.git#tag=v$pkgver"
  "org.kartkrew.RingRacers.desktop")
sha256sums=('SKIP'
            '812a12ad6a7e5ef7bea3ef3b24bc4e686e9b8df16221c478f202c96ee6ce413d')
build() {
  cd "${pkgname}"
  cmake -G Ninja -Wno-dev \
    -Bbuild \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSRB2_SDL2_EXE_NAME="ringracers" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_C_FLAGS_NONE="-DNDEBUG" \
    -DCMAKE_CXX_FLAGS_NONE="-DNDEBUG" \
    -DACSVM_INSTALL_LIB=OFF
  cmake --build build
}

package() {
  install -Dm755 "$pkgname"/build/bin/ringracers "$pkgdir"/usr/bin/ringracers

  install -Dm644 "$pkgname"/srb2.png "$pkgdir"/usr/share/pixmaps/org.kartkrew.RingRacers.png
  install -Dm644 org.kartkrew.RingRacers.desktop "$pkgdir"/usr/share/applications/org.kartkrew.RingRacers.desktop
}