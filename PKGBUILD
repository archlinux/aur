# Maintainer: Erik Kallen <info@erikkallen.nl>

pkgname=sdl3_image
pkgver=3.2.0
pkgrel=1
pkgdesc="SDL3 image loading library"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_image"
license=('0BSD')
depends=('sdl3' 'libpng' 'libtiff' 'libjpeg' 'libwebp' 'libavif' 'libjxl')
makedepends=('cmake')
conflicts=('sdl3_image-git')
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL3_image-${pkgver}.tar.gz")
sha256sums=('1690baea71b2b4ded9895126cddbc03a1000b027d099a4fb4669c4d23d73b19f')

build() {
  cmake -B build -S "SDL3_image-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSDL3_IMAGE_SAMPLES=OFF \
    -DSDL3_IMAGE_TESTS=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "SDL3_image-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 