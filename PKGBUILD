# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=2.0
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=(x86_64)
url=https://github.com/Sysinternals/ProcDump-for-Linux
license=(MIT)
depends=(gdb)
makedepends=(clang)
source=("$url/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha256sums=('257bb77a1ee08989b098057e6ebc3761d7a9ccab14c8c45c2eb871ae1948594f')

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
