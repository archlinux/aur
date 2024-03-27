# Maintainer: Rocket Aaron <i at rocka dot me>

_repo=uswitch
pkgname=plasma6-applets-uswitch
# TODO remove this when new version releases
_commit=440f2d859468aa5a8958766c171ff3f5e01d90f5
pkgver=1.3.0
pkgrel=1
pkgdesc='Modified version of User Switch plasmoid'
url="https://gitlab.com/divinae/uswitch"
license=('GPL-3.0-only')
arch=('any')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules')
source=("$_repo-$pkgver.tar.gz::https://gitlab.com/divinae/$_repo/-/archive/$_commit/archive.tar.gz"
        "CMakeLists.txt")
sha256sums=('c1752af72c5df6a456de058dd8d5248ea68a312ed3fe3cf821fc15ecb7a08cca'
            '6a650bb4f2e4781a2b0a33f088cc1dad97f21547cc93b2b7b1b64d0dfbb9f35b')

build() {
  local _src="$_repo-$_commit"
  cp "$srcdir/CMakeLists.txt" "$_src"
  cmake -S "$_src" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
