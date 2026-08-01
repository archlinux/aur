# Maintainer: Nakanomk <56832666+Nakanomk@users.noreply.github.com>

pkgname=seekey
pkgver=0.2.1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7dcc0d65b1465573a87f26ee25ecbc9372c6673db1b5aa1b7a246dcb3a818bd4')

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
}
