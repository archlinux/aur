# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprutils-frozen
pkgver=0.7.0.r0.g05878d9
pkgrel=1
conflicts=('hyprutils-git' 'hyprutils')
provides=('hyprutils-frozen' "libhyprutils.so")
pkgdesc="Hyprland utilities library used across the ecosystem - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprutils-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  pixman
)
makedepends=(
  cmake
  git
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