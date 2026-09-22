# Maintainer: marvic2409
pkgname=sway-nook
pkgver=0.1.0
pkgrel=1
pkgdesc='Native scratchpad shelf for Sway'
arch=('x86_64')
url='https://github.com/marvic2409/sway-nook'
license=('GPL-3.0-only')
depends=('sway' 'grim' 'gtk3' 'gtk-layer-shell' 'json-glib'
         'glib2' 'glibc' 'gdk-pixbuf2' 'at-spi2-core')
makedepends=('meson' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('560bc726a5f20770d39e0b1056342ad84ad694c8865c1e8a6d121a121f6edc15')

build() {
  arch-meson "$srcdir/$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
