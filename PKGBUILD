# Maintainer: Alex Sutila <alexsutila2020@gmail.com>
pkgname=libretro-irogb-git
pkgver=r806.6970cb0
pkgrel=1
# epoch=1
pkgdesc="Gameboy Color System core"
arch=('x86_64' 'aarch64')
url="https://github.com/alexsutila/irogb"
license=('GPL3')
groups=('libretro')
depends=('libretro-core-info')
makedepends=(
  git
  cmake
)
source=(
  libretro-irogb::git+https://github.com/alexsutila/irogb.git
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/libretro-irogb"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/libretro-irogb"
  make libretro
}

package() {
  local so="$srcdir/libretro-irogb/bin/irogb_libretro.so"
  [[ -f "$so" ]] || {
    echo "ERROR: expected build artifact not found: $so"
    return 1
  }

  install -Dm 644 \
    "$so" \
    "$pkgdir/usr/lib/libretro/irogb_libretro.so"
}
