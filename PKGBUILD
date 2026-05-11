# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hypridle-frozen
pkgver=0.1.6.r1.g66d1815
pkgrel=1
pkgdesc="Hyprland's idle daemon - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hypridle-hyprland-v0.54.git"
license=('BSD-3-Clause')

conflicts=("hypridle-git")
provides=("hypridle-frozen" "hypridle")

depends=(
  hyprlang-frozen
  hyprutils-frozen
  'sdbus-cpp>=2.0.0'
  systemd
  wayland
)
makedepends=(
  cmake
  git
  hyprland-protocols-frozen
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
