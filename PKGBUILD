# Maintainer: Darko Nikolic <darkonikoloc@gmail.com>

pkgname=mwc
pkgver=0.1.3
pkgrel=2
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
provides=(wayland-compositor)
source=("$pkgname-$pkgver.tar.gz::https://github.com/nikoloc/mwc/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  ninja -C build
}

package() {
  cd "$pkgname-$pkgver"
  ninja -C build install
}

