# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=libajantv2
pkgver=16.1
pkgrel=1
pkgdesc="Open Source Static Libs and Headers for building applications that only wish to statically link against"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/aja-video/ntv2"
license=("MIT")
depends=()
makedepends=("cmake")
# Use commit hash for now because some Cmake fixes were merged
source=("ntv2::git+https://github.com/aja-video/ntv2.git#commit=abf17cc1e7aadd9f3e4972774a3aba2812c51b75")
sha256sums=("SKIP")

prepare() {
  cd ntv2

  sed -i 's/Clang|GNU/GNU/g' cmake/CommonFlags.cmake
  sed -i 's/Linux|Darwin/Linux/g' cmake/CommonFlags.cmake
}

build() {
  cd ntv2
  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd ntv2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  cd build
  make install DESTDIR="$pkgdir"
}
