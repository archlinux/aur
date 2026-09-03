# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-coreutils-bin
pkgver=0.11.0
pkgrel=2
pkgdesc="Cross-platform Rust rewrite of the GNU coreutils (upstream PGO optimized x86_64 binaries)"
arch=('aarch64' 'arm' 'i686' 'x86_64')
url="https://uutils.org/"
license=('MIT')
provides=("uutils-coreutils=$pkgver")
conflicts=('uutils-coreutils')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/uutils/coreutils/refs/heads/main/LICENSE")
#source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-aarch64-unknown-linux-musl.tar.gz")
#source_arm=("$pkgname-$pkgver-arm.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
#source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-i686-unknown-linux-musl.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('SKIP')
#sha256sums_aarch64=('99405c97458c4b10382d8570108519188b5410a0e0e380c74b77ca7bf7efd322')
#sha256sums_arm=('e9ff18aa4cb10aa9939e96f1d5e4284f3117dee49cac90e916640e2e913b0b7e')
#sha256sums_i686=('37ecad40934d210221e720f36705d568f4e0e28578d47fc10e2a93f96603d49e')
sha256sums_x86_64=('ac8e24885abf9062b80e8e86990d5727c186939c02fee777b1723e5c85293ca9')


package() {
  cd "coreutils-$pkgver-$CARCH-"*

  install -Dm755 "coreutils" "$pkgdir/usr/bin/uu-coreutils"

  while IFS= read -r line; do
    ln -s "/usr/bin/uu-coreutils" "$pkgdir/usr/bin/uu-$line"
  done < <("$pkgdir/usr/bin/uu-coreutils" --list)

  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/uutils-coreutils/LICENSE"
}
