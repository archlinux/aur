# Maintainer: Michael Rydén (zynex(at)zoik.se)

pkgname=avbroot
pkgver=3.37.1
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')
depends=('glibc')
makedepends=('rust' 'gcc' 'git')
options=('!debug')

source=("https://github.com/chenxiaolong/avbroot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab97eb47c4e8bcf87886c848a98a27d832b54d0978c2b66b00e05e36d2d43082')

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
