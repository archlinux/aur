# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprtoolkit-frozen
pkgver=r97.f3e4245
pkgrel=1
conflicts=('hyprtoolkit-git' 'hyprtoolkit')
provides=('hyprtoolkit-frozen' 'libhyprtoolkit.so')
pkgdesc="A modern C++ Wayland-native GUI toolkit - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprtoolkit-hyprland-v0.54.git"
license=('BSD-3-Clause')

depends=(
    aquamarine-frozen
    egl-gbm
    iniparser
    hyprgraphics-frozen
    hyprlang-frozen
    hyprutils-frozen
    hyprwayland-scanner-frozen
    libdrm
    libxkbcommon
    pango
    pixman
    wayland
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
