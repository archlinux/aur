# Maintainer: redtide <redtid3@gmail.com>

_name=Arqiver
pkgname=arqiver
pkgver=0.11.0
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
b2sums=('a09642242eb5a0ce11766baa1cfe582d2693399536eb1114f657dad48492142d32ab3f9b7c2f17318c081587ec0956fab00d8f0b5ac82fe1117099d8607a4678')
sha512sums=('99cd379a11d30f66c63f85397f03dea3e830b668feb46df05d348632b987d75fbc0936ccdbf4eb9d72969e017832f487889bf75b556c5b4022f9549596e396d6')

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
