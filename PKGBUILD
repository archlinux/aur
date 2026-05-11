# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprwayland-scanner-frozen
pkgver=0.4.4.r2.g206367a
pkgrel=1
conflicts=('hyprwayland-scanner-git' 'hyprwayland-scanner')
provides=('hyprwayland-scanner-frozen')
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++ - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprwayland-scanner-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
  pugixml
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
