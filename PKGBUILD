# Maintainer: Marcel R. <m5rcel.work>
pkgname=bwfall
pkgver=1.0.0
pkgrel=1
pkgdesc="Binary Waterfall CLI - Raw Data Media Player for any binary file"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/m4rcel-lol/bwfall"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'ncurses')
optdepends=(
  'libpulse: PulseAudio audio backend'
  'pipewire: PipeWire audio backend'
)
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/m4rcel-lol/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')

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
