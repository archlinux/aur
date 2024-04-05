# Maintainer: VJSchneid <info at vjs dot io>
# Contributor: jerry73204 <jerry73204@gmail.com>

pkgname=elfio
pkgver=3.12
pkgrel=1
pkgdesc="ELFIO - ELF (Executable and Linkable Format) reader and producer implemented as a header only C++ library"
arch=('any')
url="https://github.com/serge1/ELFIO"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
options=()
source=("$url/releases/download/Release_$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('caf49f3bf55a9c99c98ebea4b05c79281875783802e892729eea0415505f68c4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev \
    -DELFIO_BUILD_EXAMPLES=OFF \
    -DELFIO_BUILD_TESTS=OFF # test directory is not included in release
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
