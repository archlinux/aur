# Maintainer: swim <swim853279614@163.com>
pkgname=plasma-lyrics
pkgver=0.3.2
pkgrel=1
pkgdesc='Native synchronized desktop lyrics widget for Plasma 6'
arch=('x86_64')
url='https://github.com/swim233/plasma-lyrics'
license=('GPL-2.0-only')
depends=('plasma-workspace' 'libplasma' 'kirigami' 'ksvg' 'ki18n' 'kdeclarative'
         'qt6-base' 'qt6-declarative' 'glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swim233/plasma-lyrics/releases/download/v0.3.2/plasma-lyrics-0.3.2.tar.gz")
sha256sums=('00009ff6358e8af44cd2e6e7ab337889f61a55f5c26b8ef2d1534ef65b097830')

build() {
  # None rather than Release: it leaves the compiler flags to
  # makepkg.conf, so the package picks up Arch's hardening and
  # debug-package settings instead of CMake's own -O3 -DNDEBUG.
  cmake -S "$pkgname-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
