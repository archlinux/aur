# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprland-guiutils-frozen
pkgver=0.1.0.r0.ga415eba
pkgrel=1
conflicts=('hyprland-guiutils' 'hyprland-guiutils-git')
provides=('hyprland-guiutils-frozen')
pkgdesc="Hyprland GUI utilities (successor to hyprland-qtutils) - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')

url="https://gitlab.com/TheEnchantedPotato/mirror-hyprland-guiutils-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
    hyprlang-frozen
    hyprtoolkit-frozen
    hyprutils-frozen
    libdrm
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


