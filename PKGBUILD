# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pipewire-gobject
pkgver=0.3.11
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
sha256sums=('35d757b07c1ea2efdf87a7f7f77609ee69f725e1b6b13095de38b957b9a92b23')

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
