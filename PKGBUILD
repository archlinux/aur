pkgname=image-analyze
pkgver=3.3.1
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('any')
url="https://github.com/prismaticbridge/image-analyze"
sha256sums=('154e240dc2c708c7943332dea815729ceb58bc28254b9412ee6c7925bd47c32a')
licence='GPL2'
depends=('glfw' 'libspng' 'libjpeg-turbo')
makedepends=('base-devel' 'cmake' 'pkgconf')
optdepends=('libheif: HEIF/HEIC image support')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build "$srcdir/build" --parallel
}
package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
