# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=aquamarine-frozen
pkgver=0.8.0.r3.gc8282f4
pkgrel=1
conflicts=('aquamarine' 'aquamarine-git')
provides=('aquamarine-frozen' 'aquamarine' "libaquamarine.so")
pkgdesc="Aquamarine is a very light linux rendering backend library - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/aquamarine-frozen-mirror.git"
license=('BSD-3-Clause')

depends=(
  gcc-libs
  glibc
  hyprutils-frozen
  hyprwayland-scanner-frozen
  libdisplay-info
  libdrm
  libglvnd
  libinput
  mesa
  opengl-driver
  pixman
  pugixml
  seatd
  systemd-libs
  wayland
  wayland-protocols
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
