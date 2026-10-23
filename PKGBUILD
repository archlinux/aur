pkgname=image-analyze
pkgver=3.2.1
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('any')
url="https://github.com/prismaticbridge/image-analyze"
sha256sums=('1238366ebffe9a73cb427a23fa4bf3b3a7836102c2d7246762f66e3c5c296ee5')
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
