# Maintainer: workonfire <kolucki62@gmail.com>

_pkgname=kwin6-effects-yet-another-magic-lamp
pkgname=$_pkgname-git
pkgver=r113.8f4baf9
pkgrel=1
pkgdesc="Yet Another Magic Lamp effect - ported to Plasma 6.6"
arch=('x86_64')
url="https://github.com/snpynk/kwin-effects-yet-another-magic-lamp"
license=('GPL2')

depends=(
  kwin
  qt6-base
  kconfig
  kcoreaddons
  kwindowsystem
)

makedepends=(
  git
  cmake
  extra-cmake-modules
  qt6-tools
)

provides=($_pkgname)
conflicts=($_pkgname)

source=("git+https://github.com/snpynk/kwin-effects-yet-another-magic-lamp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/kwin-effects-yet-another-magic-lamp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$srcdir/kwin-effects-yet-another-magic-lamp" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
