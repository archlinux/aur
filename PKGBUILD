# Maintainer: Michael Rydén (zynex(at)zoik.se)
pkgname=avbroot
pkgver=3.17.2
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')
depends=('glibc')
makedepends=('rust' 'gcc' 'git')
options=('!debug')

source=("https://github.com/chenxiaolong/avbroot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91e12373159138ea960d4cbe72d27a4bf31cfeb8697a845b8e8b92faa103fb85')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Lös problem med ring's LTO
  export CFLAGS+=" -ffat-lto-objects"

  # Bygg med systemets rust/cargo
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/avbroot" "$pkgdir/usr/bin/avbroot"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
