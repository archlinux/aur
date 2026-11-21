# Maintainer: Kevin Meagher <kmeagher at icecube dot wisc dot edu>
pkgname=xfwm-wayland
pkgver=0.7.41
pkgrel=1
pkgdesc="A very fast and efficient Wayland compositor for Xfce built on wlroots that behaves like xfwm4"
arch=('x86_64')
url="https://github.com/fulalas/xfwm-wayland"
license=('GPL-2.0-or-later')
depends=(glibc gtk3 libglvnd libdrm glib2 cairo libxcb libxkbcommon pango pixman libinput gdk-pixbuf2 xfconf wlroots0.20 wayland librsvg json-glib xcb-util-wm)
makedepends=(meson ninja wayland-protocols)
optdepends=('xorg-xwayland: run X11 programs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fulalas/xfwm-wayland/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f8628f2bb65013a19a1d1224c988e07cd197d63e02401b3737e94781cea50e81')

prepare() {
  meson subprojects download --sourcedir="$pkgname-$pkgver"
}

build() {
	arch-meson build "$pkgname-$pkgver"
	ninja -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" ninja install -C build
}
