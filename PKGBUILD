# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gulkan
pkgver=0.16.0
pkgrel=4
pkgdesc="GLib library for Vulkan abstraction"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gulkan"
license=('MIT')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'glib2' 'graphene' 'libwayland-client.so' 'libxcb'
         'libxkbcommon' 'vulkan-icd-loader' 'xcb-util-keysyms')
makedepends=('meson' 'glew' 'glfw' 'gtk-doc' 'json-glib' 'libdrm' 'libegl' 'pango' 'shaderc'
             'vulkan-headers' 'wayland' 'wayland-protocols')
source=("https://gitlab.freedesktop.org/xrdesktop/gulkan/-/archive/$pkgver/gulkan-$pkgver.tar.gz")
sha256sums=('20f7a562bf7058322ecfbfcf75de7a76d80a0b33c3bdea62d873d353d1fe4ced')


build() {
  cd "$pkgname-$pkgver"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gulkan"
}
