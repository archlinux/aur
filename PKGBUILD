# Maintainer: Andy Kluger <AndyKluger@mailfence.com>
# Contributor: redtide <redtid3@gmail.com>

_name=Arqiver
pkgname=arqiver
pkgver=1.0.2
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
sha512sums=('a7873bffcbfdd9f119e6245df5922ef06566ff03840834fac8e67e23cbf4f04487a3761c784994a2a2ff1995b4d83ebcc4593065a1877c1c10848135120e25db')

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
