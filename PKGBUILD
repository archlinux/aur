# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gxr
pkgver=0.15.2
pkgrel=3
pkgdesc="glib wrapper for the OpenVR and soon the OpenXR API"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gxr"
license=('MIT')
depends=('glibc' 'glib2' 'gtk3' 'gulkan' 'openvr')
makedepends=('meson' 'glslang' 'vulkan-headers')
optdepends=('glfw')
source=("https://gitlab.freedesktop.org/xrdesktop/gxr/-/archive/$pkgver/gxr-$pkgver.tar.bz2")
sha256sums=('2bd257d898f45b0c8510ce239604dd1ef4081cb8ee6079ac8042ed4c9e42ce4a')


build() {
  cd "$pkgname-$pkgver"

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gxr"
}
