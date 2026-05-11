# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprcursor-frozen
pkgver=0.1.12.r1.g2fd3642
pkgrel=1
pkgdesc="The hyprland cursor format, library and utilities - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprcursor-hyprland-v0.54.git"
license=('BSD-3-Clause')
conflicts=("hyprcursor-git")
provides=("hyprcursor-frozen" "hyprcursor" "libhyprcursor.so")

depends=(
  cairo
  hyprlang-frozen
  librsvg
  libzip
  tomlplusplus
)

makedepends=(
  git
  cmake
  ninja
)

_pkgsrc=$pkgname
source=("$_pkgsrc::git+$url")
sha256sums=('SKIP')

build() {
  local cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
