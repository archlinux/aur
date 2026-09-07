pkgname=image-analyze
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight image viewer for wayland"
arch=('any')
url="https://github.com/ArthurGuihaire/image-analyze"
sha256sums=('f4ec798586a634f23c0a543fedc6c695b89ad6c50332f026d3a335fc0c40cf1e')
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
