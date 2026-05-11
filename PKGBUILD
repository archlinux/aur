# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=xdg-desktop-portal-hyprland-frozen version 1.3.9.r5.gbe6771e
pkgver=1.3.9.r5.gbe6771e
pkgrel=1
conflicts=('xdg-desktop-portal-hyprland-git')
provides=('xdg-desktop-portal-hyprland-frozen' 'xdg-desktop-portal-hyprland' "xdg-desktop-portal-impl")
pkgdesc="xdg-desktop-portal backend for Hyprland - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-xdg-desktop-portal-hyprland-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  hyprlang-frozen
  hyprutils-frozen
  libdrm
  libinih
  libpipewire
  mesa
  qt6-base
  qt6-wayland
  sdbus-cpp
  wayland
  xdg-desktop-portal
)

makedepends=(
  cmake
  git
  hyprland-protocols-frozen
  hyprwayland-scanner-frozen
  ninja
  scdoc
  wayland-protocols
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
    -D CMAKE_INSTALL_LIBEXECDIR=lib
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
