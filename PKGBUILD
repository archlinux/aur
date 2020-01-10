# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gulkan
pkgver=0.13.2
pkgrel=1
pkgdesc="GLib library for Vulkan abstraction"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gulkan"
license=('MIT')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'glib2' 'graphene' 'vulkan-icd-loader')
makedepends=('meson' 'glslang' 'gtk-doc' 'vulkan-headers')
optdepends=('glew' 'glfw' 'libdrm')
source=("https://gitlab.freedesktop.org/xrdesktop/gulkan/-/archive/$pkgver/gulkan-$pkgver.tar.bz2")
sha256sums=('ed0e84980b1a763fb899db9757005d51190973b0725b69a6223cefc0d8e03831')


build() {
  cd "$pkgname-$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    "_build"
  ninja -C "_build"
}

check() {
  cd "$pkgname-$pkgver"

  #meson test -C "_build"
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" meson install -C "_build"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gulkan"
}
