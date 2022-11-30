# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gulkan
pkgver=0.16.0
pkgrel=2
pkgdesc="GLib library for Vulkan abstraction"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gulkan"
license=('MIT')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'glib2' 'graphene' 'vulkan-icd-loader')
makedepends=('meson' 'glew' 'glfw' 'gtk-doc' 'json-glib' 'libdrm' 'libegl'
             'libxkbcommon' 'pango' 'shaderc' 'vulkan-headers' 'wayland' 'wayland-protocols'
             'xcb-util-keysyms')
source=("https://gitlab.freedesktop.org/xrdesktop/gulkan/-/archive/$pkgver/gulkan-$pkgver.tar.bz2")
sha256sums=('a5ad911a73ec3d59d8395e8adc8858abebd21dc10a36f5977e11c12a8511473e')


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
