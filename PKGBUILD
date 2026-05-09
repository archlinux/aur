# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('pipewire-gobject')
pkgver=0.3.5
pkgrel=1
pkgdesc="Experimental GObject Introspection wrapper for app-facing PipeWire APIs"
arch=('x86_64')
url="https://bhack.github.io/pipewire-gobject"
license=('MIT')
depends=(
  'libgirepository'
  'libpipewire'
  'python-gobject'
)
makedepends=(
  'gobject-introspection'
  'meson'
)
provides=('libpwg-0.1.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bhack/pipewire-gobject/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('58c4e4443d78966e347ca8845b1690056aad6fc542b31fe4ea552cff0768b19e')

build() {
  arch-meson "$pkgname-$pkgver" build -Dwheel=true
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
