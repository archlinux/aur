# Maintainer: Darko Nikolic <darkonikoloc@gmail.com>

pkgname=mwc-git
pkgver=r275.b8e4c36
pkgrel=1
pkgdesc='tiling wayland compositor based on wlroots and scenefx'
arch=('x86_64')
url='https://github.com/nikoloc/mwc'
license=(MIT)
depends=(
  glibc
  wayland
  libinput
  libdrm
  pixman
  libxkbcommon
  libwlroots-0.18.so
  libscenefx-0.2.so
)
makedepends=(git meson ninja wayland-protocols)
optdepends=(
  'kitty: terminal emulator used in the default configuration'
  'rofi-wayland: app-launcher used in the default configuration'
  'xdg-desktop-portal: base xdg-desktop-portal'
  'xdg-desktop-portal-gtk: default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
provides=(mwc wayland-compositor)
conflicts=(mwc)
source=("$pkgname::git+https://github.com/nikoloc/mwc.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname"
  ninja -C build install
}

