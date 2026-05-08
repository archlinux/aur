# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprland-protocols-frozen
pkgver=0.8.0.r3.gc8282f4
pkgrel=1
conflicts=('hyprland-protocols' 'hyprland-protocols-git')
provides=('hyprland-protocols-frozen' 'hyprland-protocols')
pkgdesc="Wayland protocol extensions for Hyprland - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprland-protocols-hyprland-v0.54.git"
license=('BSD-3-Clause')

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


