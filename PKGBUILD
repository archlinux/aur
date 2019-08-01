# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gulkan
pkgver=0.12.1
pkgrel=1
pkgdesc="GLib library for Vulkan abstraction"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gulkan"
license=('MIT')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'glib2' 'graphene' 'vulkan-icd-loader')
makedepends=('meson' 'glslang' 'gtk-doc' 'vulkan-headers')
optdepends=('glew' 'glfw' 'libdrm')
source=("https://gitlab.freedesktop.org/xrdesktop/gulkan/-/archive/$pkgver/gulkan-$pkgver.tar.bz2")
sha256sums=('de3e176648f441c48a037acf4763d8b07754c3c2d8f3e38b05ec2f9e1c03e86d')


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
