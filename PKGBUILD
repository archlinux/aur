# Maintainer: Darko Nikolic <darkonikoloc@gmail.com>

pkgname=owl-compositor-git
pkgver=r180.dcb567a
pkgrel=1
pkgdesc='tiling wayland compositor based on wlroots'
arch=('x86_64')
url='https://github.com/dqrk0jeste/owl'
license=(MIT)
depends=(
  glibc
  wayland
  libinput
  libdrm
  pixman
  libxkbcommon
  libwlroots-0.18.so
)
makedepends=(git make wayland-protocols)
optdepends=(
  'kitty: terminal emulator used in the default configuration'
  'rofi-wayland: app-launcher used in the default configuration'
  'xdg-desktop-portal: base xdg-desktop-portal'
  'xdg-desktop-portal-gtk: default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("$pkgname::git+https://github.com/dqrk0jeste/owl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
	install -Dm755 build/owl "$pkgdir/usr/bin/owl"
	install -Dm755 build/owl-ipc "$pkgdir/usr/bin/owl-ipc"
	install -Dm644 default.conf "$pkgdir/usr/share/owl/default.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 owl.desktop "$pkgdir/usr/share/wayland-sessions/owl.desktop"
	install -Dm644 owl-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/owl-portals.conf"
}
