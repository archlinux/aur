# Maintainer: Michael Rydén (zynex(at)zoik.se)

pkgname=avbroot
pkgver=3.23.1
pkgrel=1
pkgdesc="Application for patching Android A/B-style OTA images for root access"
arch=('x86_64')
url="https://github.com/chenxiaolong/avbroot"
license=('GPL')
depends=('glibc')
makedepends=('rust' 'gcc' 'git')
options=('!debug')

source=("https://github.com/chenxiaolong/avbroot/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6ce39007b4612d4c363487bef8376038d801ce20fe32f90246531acffc2bee9c')

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
