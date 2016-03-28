# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=webp-pixbuf-loader
pkgver=20140823
pkgrel=1
pkgdesc='WebM GDK Pixbuf Loader library'
arch=('x86_64' 'i686')
url='https://github.com/aruiz/webp-pixbuf-loader'
license=('GPL')
depends=('gdk-pixbuf2' 'libwebp')
makedepends=('cmake')
install=webp-pixbuf-loader.install
source=("git+https://github.com/aruiz/webp-pixbuf-loader.git#commit=5610f216ba1a47fa97f8bda6edef57b6e53dc16f"
        "CMakeLists.txt")
sha256sums=('SKIP' af1694e1f4a08a4c85e717c515887c3c57a72e5cb0cdd174bffe55810ceaf7e0)

build() {
  mv CMakeLists.txt "$pkgname"
  cd "$pkgname"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:STRING=/usr ..
  make pixbufloader-webp
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir/" install/fast
}
