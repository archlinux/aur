# Maintainer: redtide <redtid3@gmail.com>

_name=Arqiver
pkgname=arqiver
pkgver=0.12.0
pkgrel=1
pkgdesc="Simple Qt archive manager based on libarchive"
arch=(x86_64)
url="https://github.com/tsujan/$_name"
license=(GPL3)
depends=(
  libarchive
  gzip
  p7zip
  qt5-svg
)
makedepends=(
  cmake
  git
  qt5-tools
)
source=($url/releases/download/V$pkgver/$_name-$pkgver.tar.xz)
b2sums=('5f2d808e945876f7bc4a7151d885d60d92e160af038c558200391eeb4502e42361991c8328a59a95e9780780af12f55459a34531855efce573c91dd227043fa3')
sha512sums=('d0dfc4c60416bf118d96c3c74289bf273c9e0ae54db185496cfe4b87732e8c2351ef15633b1a005ecafc7dbe9558d369d02681cdcbf643b65bb26d540fb25f71')

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
