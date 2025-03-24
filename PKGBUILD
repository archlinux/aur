# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: redtide <redtid3@gmail.com>

_name=Arqiver
pkgname=arqiver
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple Qt archive manager based on libarchive"
arch=(x86_64)
url="https://github.com/tsujan/$_name"
license=(GPL3)
depends=(
  libarchive
  gzip
  7zip
)
makedepends=(
  cmake
  qt6-svg
  qt6-tools
)
source=($url/releases/download/V$pkgver/$_name-$pkgver.tar.xz)
sha512sums=('384fbacfd37ae8b9b313ab5bfc539c2569f1d213d574f855379176dda9557198d3467d41adf58eaeb15dcb15a88a44be962dc152607ad832717ae17f86d9d436')

build() {
  cd "$_name-$pkgver"
  local options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S .
    -W no-dev
  )
  cmake "${options[@]}"
  cmake --build build --verbose
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
}
