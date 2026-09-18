# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-coreutils-bin
pkgver=0.12.0
pkgrel=3
pkgdesc="Cross-platform Rust rewrite of the GNU coreutils (upstream PGO optimized binaries)"
arch=('aarch64' 'x86_64') # 'arm' 'i686'
url="https://uutils.org/"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("uutils-coreutils=$pkgver")
conflicts=('uutils-coreutils')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/uutils/coreutils/refs/heads/main/LICENSE")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
#source_arm=("$pkgname-$pkgver-arm.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
#source_i686=("$pkgname-$pkgver-i686.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-i686-unknown-linux-musl.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/uutils/coreutils/releases/download/$pkgver/coreutils-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
sha256sums_aarch64=('8ded600eb3f6099d9f085d0e1ba8a5c002b8df1929d7f6c86d9cd03355ac3c5f')
#sha256sums_arm=('e9ff18aa4cb10aa9939e96f1d5e4284f3117dee49cac90e916640e2e913b0b7e')
#sha256sums_i686=('37ecad40934d210221e720f36705d568f4e0e28578d47fc10e2a93f96603d49e')
sha256sums_x86_64=('e08bd526f3c14717b145dfed4dbff5545848ca67a9b940be7ff7de5afea32786')


package() {
  cd "coreutils-$pkgver-$CARCH-"*

  install -Dm755 "coreutils" "$pkgdir/usr/bin/uu-coreutils"

  while IFS= read -r line; do
    ln -s "/usr/bin/uu-coreutils" "$pkgdir/usr/bin/uu-$line"
  done < <("$pkgdir/usr/bin/uu-coreutils" --list)

  install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/uutils-coreutils/LICENSE"
}
