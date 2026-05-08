# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprlock-frozen
pkgver=0.9.1.r1.g347e05a
pkgrel=1
conflicts=('hyprlock' 'hyprlock-git')
provides=('hyprlock-frozen' 'hyprlock')
pkgdesc="Hyprland's GPU-accelerated screen locking utility - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
backup=('etc/pam.d/hyprlock')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprlock-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  'sdbus-cpp>=2.0.0'
  hyprgraphics-frozen
  hyprlang-frozen
  hyprutils-frozen
  libdrm
  libglvnd
  libxkbcommon
  mesa
  pam
  pango
  wayland
)

makedepends=(
  cmake
  git
  hyprwayland-scanner-frozen
  ninja
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
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
