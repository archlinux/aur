# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=libajantv2
pkgver=16.2
pkgrel=1
pkgdesc="AJA NTV2 Open Source Static Libs and Headers for building applications that only wish to statically link against"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/aja-video/ntv2"
license=("MIT")
depends=()
makedepends=("cmake")
options=('debug')
source=("ntv2::git+https://github.com/aja-video/ntv2.git#tag=v$pkgver")
sha256sums=("SKIP")

build() {
  cd ntv2
  mkdir -p build; cd build

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAJA_BUILD_OPENSOURCE=ON ..

  make
}

package() {
  cd ntv2
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  cd build
  make install DESTDIR="$pkgdir"
}
