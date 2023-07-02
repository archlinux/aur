# Maintainer: redtide <redtid3@gmail.com>

_pkgname=colorpick
pkgname=$_pkgname-git
pkgver=r57.e13ad60
pkgrel=1
pkgdesc="Color picker and contrast checker"
url=https://github.com/agateau/$_pkgname
arch=(x86_64)
license=(BSD)
depends=(
  extra-cmake-modules # ECM
  qt5-base
  kguiaddons
  kwidgetsaddons
)
makedepends=(
  cmake
  git
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha512sums=(SKIP)
pkgver() {
  cd "$srcdir"/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -vDm 644 $_pkgname/README.md -t "$pkgdir"/usr/share/doc/$_pkgname/
}
