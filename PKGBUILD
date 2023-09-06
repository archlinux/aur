# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=2.2
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=(x86_64)
url=https://github.com/Sysinternals/ProcDump-for-Linux
license=(MIT)
depends=(gdb)
makedepends=(clang)
source=("$url/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha256sums=('afc063796116e24e7e2961a28c23fcb80c2ec107ed0efb5dc6c30ed6e01d5d81')

prepare() {
  cd ProcDump-for-Linux-"$pkgver"
  sed -i 's, -Werror,,g' Makefile  # accept the warnings here
}

build() {
  cd ProcDump-for-Linux-"$pkgver"
  make -j1
}

package() {
  cd ProcDump-for-Linux-"$pkgver"
  install -Dt "$pkgdir"/usr/bin bin/procdump
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 procdump.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/procdump LICENSE
}
