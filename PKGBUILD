# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=1.5
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=(x86_64)
url=https://github.com/Sysinternals/ProcDump-for-Linux
license=(MIT)
depends=(gdb)
makedepends=(clang)
source=("$url/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha256sums=('12866fac971e1000f5fda2faaf5df014f06f3c608e3d345885bff36365b8530f')

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

# vim:set ts=2 sw=2 et:
