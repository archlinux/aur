# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pipewire-gobject
pkgver=0.3.7
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
sha256sums=('e87cc0d80fbc4e2d40f5d7758e0ef72ad3b42a09476793431ed6730d7660bd8b')

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
