# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pipewire-gobject
pkgver=0.3.10
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
sha256sums=('8d82e4d2066e4d91e40fcf1a9d974d1429deae62cb359d3159963911295d6356')

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
