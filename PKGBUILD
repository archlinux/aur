# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=g3k
pkgver=0.16.0
pkgrel=3
pkgdesc="A 3DUI widget toolkit"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/g3k"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gxr' 'json-glib' 'libcanberra' 'pango' 'shaderc')
makedepends=('meson' 'vulkan-headers')
source=("$pkgname-$pkgver-src.tar.gz::https://gitlab.freedesktop.org/xrdesktop/g3k/-/archive/$pkgver/g3k-$pkgver.tar.gz")
sha256sums=('6022143a66f507f5c3524605c040b39156ab98c03ed9f071e05fdbd87bd561ef')


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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/g3k"
}
