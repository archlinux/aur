# Maintainer: Michael Rydén (zynex(at)zoik.se)

pkgname=avbroot
pkgver=3.30.1
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')
depends=('glibc')
makedepends=('rust' 'gcc' 'git')
options=('!debug')

source=("https://github.com/chenxiaolong/avbroot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b6df9e17c8b127334dd79c34d8f0e0992f0100dbf04d3dc7095fcf3fbe49e85')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS+=" -ffat-lto-objects"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/avbroot" "$pkgdir/usr/bin/avbroot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
