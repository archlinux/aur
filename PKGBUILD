# Maintainer: marvic2409
pkgname=sway-nook
pkgver=0.1.1
pkgrel=1
pkgdesc='Native scratchpad shelf for Sway'
arch=('x86_64')
url='https://github.com/marvic2409/sway-nook'
license=('GPL-3.0-only')
depends=('sway' 'grim' 'gtk3' 'gtk-layer-shell' 'json-glib'
         'glib2' 'glibc' 'gdk-pixbuf2' 'at-spi2-core')
makedepends=('meson' 'ninja')
checkdepends=('xorg-server-xvfb' 'xorg-xauth')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('956a57e6b97f327f360e3a991a679903607b60e9863c3eeeca04c338d2d819bc')

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
