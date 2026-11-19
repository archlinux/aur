# Maintainer: robertfoster
# The kernel module is built into linux-multikernel
pkgbase=daxfs
pkgname=daxfs-utils
# renovate: datasource=github-tags depName=multikernel/daxfs
pkgver=0.1.0
pkgrel=3
pkgdesc="DAX-based filesystem for multikernel and multi-host shared memory (mkdaxfs and daxfs-inspect)"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/multikernel/daxfs"
license=('GPL-2.0-only')
depends=('glibc')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

build() {
  cd "$pkgbase-$pkgver"
  # tools/Makefile links with $(CFLAGS) only
  make -C tools CFLAGS="$CFLAGS $LDFLAGS -I../include"
}

package() {
  cd "$pkgbase-$pkgver/tools"
  install -Dm755 -t "$pkgdir/usr/bin" mkdaxfs daxfs-inspect
}
sha256sums=('d9e0f9b5aee1f1a707f9b09bac9222a21ab34afebf10eedbbb1554ed69d970ed')
