# Maintainer: Erik Kallen <info@erikkallen.nl>

pkgname=sdl3_image
pkgver=3.2.4
pkgrel=1
pkgdesc="SDL3 image loading library"
arch=('any')
url="https://github.com/libsdl-org/SDL_image"
license=('0BSD')
depends=('sdl3' 'libpng' 'libtiff' 'libjpeg' 'libwebp' 'libavif' 'libjxl')
makedepends=('cmake')
conflicts=('sdl3_image-git')
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-${pkgver}/SDL3_image-${pkgver}.tar.gz")
sha256sums=('a725bd6d04261fdda0dd8d950659e1dc15a8065d025275ef460d32ae7dcfc182')

build() {
  cmake -B build -S "SDL3_image-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSDLIMAGE_SAMPLES=OFF \
    -DSDLIMAGE_TESTS=OFF

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "SDL3_image-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 