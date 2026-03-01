# Maintainer: Your Name <you@example.com>
pkgname=bwfall
pkgver=1.0.0
pkgrel=1
pkgdesc="Binary Waterfall CLI - Raw Data Media Player for any binary file"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/yourname/bwfall"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'ncurses')
optdepends=(
  'libpulse: PulseAudio audio backend'
  'pipewire: PipeWire audio backend'
)
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/m4rcel-lol/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('53c94c1f11385b79ef7fb6815046c122f04dbc5efd36a9f8a63b294e872582e1fb4a45b02908b6f5b606bf7ab2da574581b6b0b046e135d3678b7810d0b4ef70')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$pkgname-$pkgver"
  make test || true
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
