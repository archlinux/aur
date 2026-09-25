# Maintainer: Nakanomk <56832666+Nakanomk@users.noreply.github.com>

pkgname=seekey
pkgver=0.3.0
pkgrel=1
pkgdesc='Wayland keyboard visualizer with floating key bubbles'
arch=('x86_64')
url='https://github.com/Nakanomk/Seekey'
license=('MIT')
depends=(
  'cairo'
  'glib2'
  'glibc'
  'gtk4'
  'gtk4-layer-shell'
  'json-glib'
  'libevdev'
  'ncurses'
  'pango'
)
makedepends=(
  'gettext'
  'pkgconf'
)
optdepends=(
  'fuzzel: native settings menu for --config-gui (a built-in GTK menu is used without it)'
)
install=seekey.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  '70-seekey-input.rules'
)
sha256sums=('135d5b57823651929da11658eeeba3028e079ab391a128bcdf47e35f1ac12ead'
            'b570a8b92fc07b934e8aff5bf723a7e07e4494ab01c11ce87fa7b67c3f5ec4d1')

build() {
  make -C "Seekey-$pkgver" PREFIX=/usr
}

check() {
  make -C "Seekey-$pkgver" check
}

package() {
  make -C "Seekey-$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 "Seekey-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 70-seekey-input.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-seekey-input.rules"
}
