# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gxr
pkgver=0.16.0
pkgrel=3
pkgdesc="glib wrapper for the OpenVR and soon the OpenXR API"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/gxr"
license=('MIT')
depends=('glibc' 'glib2' 'gtk3' 'gulkan' 'json-glib' 'openxr')
makedepends=('meson' 'glslang' 'vulkan-headers')
optdepends=('glfw')
source=("https://gitlab.freedesktop.org/xrdesktop/gxr/-/archive/$pkgver/gxr-$pkgver.tar.gz")
sha256sums=('938047ccc6066f5bddb6ea4d4787908d5089ad718794ea1074e319ddf21fe0fd')


build() {
  cd "$pkgname-$pkgver"

  meson setup \
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
