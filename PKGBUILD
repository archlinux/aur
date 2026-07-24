# Maintainer: Nakanomk <56832666+Nakanomk@users.noreply.github.com>

pkgname=seekey
pkgver=0.2.0
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
)
makedepends=(
  'gettext'
  'pkgconf'
)
install=seekey.install
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  '70-seekey.rules'
)
# Replace SKIP with `updpkgsums` after pushing the v${pkgver} Git tag.
sha256sums=('7984b564f2c6bf8f5b1a07f439e38ade7e3c43a2040c53d531c7ce48fcc3ad3b'
            '22cc98416e9fda899adc6787fcafd2d795ad646f8cc6dd884f5beb5fdb0cb609')

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
  install -Dm644 70-seekey.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-seekey.rules"
}
