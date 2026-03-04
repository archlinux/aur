# Maintainer: myster_gaif <myster_gaif@protonmail.com>
pkgname=ixeram
_pkgname=IxeRam
pkgver=r4.b778f7d
pkgrel=1
pkgdesc="CLI tool for RAM information and management (C++/CMake)"
arch=('x86_64')
url="https://github.com/mystergaif/IxeRam"
license=('MIT')
depends=('gcc-libs' 'keystone' 'capstone')
makedepends=('cmake' 'git' 'make')
provides=('ixeram')
conflicts=('ixeram')
source=("git+https://github.com/mystergaif/IxeRam.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
 install -Dm755 build/memdebug "$pkgdir/usr/bin/ixeram"

  install -Dm755 build/libspeedhack.so "$pkgdir/usr/lib/libspeedhack.so"
}
