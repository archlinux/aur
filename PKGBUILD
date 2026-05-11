# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

pkgname=hyprland-frozen
pkgver=0.54.0
pkgrel=1
pkgdesc="Frozen Hyprland v0.54 - Frozen For Yggdrasil, Nordix Desktop Environment (do not send bug reports to hyprwm)"
conflicts=('hyprland-git' 'hyprland')
provides=('hyprland-frozen' 'wayland-compositor')
arch=('x86_64' 'aarch64')
url="https://gitlab.com/TheEnchantedPotato/mirror-hyprland-v0.54.git"
license=('BSD-3-Clause')
backup=("usr/share/xdg-desktop-portal/hyprland-portals.conf")

depends=(
  aquamarine-frozen
  cairo
  gcc-libs
  glib2
  glibc
  glslang
  hyprcursor-frozen
  hyprgraphics-frozen
  hyprland-guiutils-frozen
  hyprutils-frozen
  hyprwire-frozen
  lcms2
  libdisplay-info
  libdrm
  libglvnd
  libinput
  libliftoff
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxfixes
  libxkbcommon
  libxrender
  lua
  mesa
  muparser
  opengl-driver
  pango
  pixman
  polkit
  re2
  seatd
  systemd-libs
  tomlplusplus
  util-linux-libs
  wayland
  wayland-protocols
  xcb-proto
  xcb-util
  xcb-util-errors
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
  xorg-xwayland
)

makedepends=(
  cmake
  glaze
  ninja
  python
  xorgproto
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
    -D NO_HYPRPM=ON
    -D CMAKE_INSTALL_PREFIX=/usr
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}