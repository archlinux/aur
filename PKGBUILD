# Maintainer: redtide <redtid3@gmail.com>

_pkgname=magnifiqus
pkgname=$_pkgname-git
pkgver=0.2.1.r0.gb525368
pkgrel=1
pkgdesc="Qt based screen magnifier"
url=https://github.com/redtide/$_pkgname
arch=(x86_64)
license=(GPL2)
depends=(
  qt5-base
  qt5-x11extras
)
makedepends=(
  cmake
  git
  qt5-tools
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha512sums=(SKIP)
pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}
build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -Wno-dev
    -B build
    -S $_pkgname
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}
package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname/
}
