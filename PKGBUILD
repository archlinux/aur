# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprlang-frozen
pkgver=0.6.7.r0.g0d00dc1
pkgrel=1
pkgdesc="The official implementation library for the hypr config language - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
conflicts=('hyprlang' 'hyprlang-git')
provides=('hyprlang-frozen' 'hyprlang' 'libhyprlang.so')
arch=('x86_64' 'aarch64')
url="https://github.com/jimmykallhagen/nordix-hyprland-mirrors"
license=('BSD-3-Clause')
backup=("usr/share/xdg-desktop-portal/hyprland-portals.conf")

depends=(
  gcc-libs
  glibc
  hyprutils-git
)
makedepends=(
  cmake
  git
  ninja
  pixman
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
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/hyprland/"
}