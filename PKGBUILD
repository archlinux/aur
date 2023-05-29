# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=libajantv2
_pkgver=16.2-bugfix5
pkgver=${_pkgver//-/_}
pkgrel=2
epoch=1
pkgdesc="AJA NTV2 Open Source Static Libs and Headers for building applications that only wish to statically link against"
arch=("x86_64" "aarch64")
url="https://github.com/aja-video/ntv2"
license=("MIT")
depends=()
makedepends=("cmake" "git")
options=('!lto' 'staticlibs' 'debug')
source=("ntv2::git+https://github.com/aja-video/ntv2.git#commit=0acbac70a0b5e6509cca78cfbf69974c73c10db9")
sha256sums=("SKIP")

build() {
  cmake -B build -S ntv2 \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DAJA_BUILD_OPENSOURCE=ON \
    -DAJA_BUILD_APPS=OFF \
    -DAJA_BUILD_SHARED=OFF \
    -DAJA_INSTALL_HEADERS=ON \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ntv2/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
