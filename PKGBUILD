# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=g3k
pkgver=0.16.0
pkgrel=1
pkgdesc="A 3DUI widget toolkit"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/xrdesktop/g3k"
license=('MIT')
depends=('glibc' 'gxr' 'json-glib' 'libcanberra' 'pango' 'shaderc')
makedepends=('meson')
source=("$pkgname-$pkgver-src.tar.bz2::https://gitlab.freedesktop.org/xrdesktop/g3k/-/archive/$pkgver/g3k-$pkgver.tar.bz2")
sha256sums=('a843205ca9194aed5fbab28d2ab3b7dbf58c4d03becf9cab69ca93f5b5a76dbf')


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
