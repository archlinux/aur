# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=3.4.0
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=(x86_64)
url=https://github.com/Sysinternals/ProcDump-for-Linux
license=(MIT)
depends=(gdb bpf)
makedepends=(clang)
options=(strip !debug)
source=("https://github.com/Sysinternals/ProcDump-for-Linux/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha256sums=('956d22f44cf8650275126b6a859fc4fec0b064e6f0b5f5ab795e2491f8f22ed3')

build() {
	cmake -B build -S ProcDump-for-Linux-"$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS="-U_FORTIFY_SOURCE" \
		-DCMAKE_CXX_FLAGS="-Wno-error=vla"
	cmake --build build
}

package() {
	#DESTDIR="$pkgdir" cmake --install build
	cd build
	install -Dt "$pkgdir"/usr/bin procdump
	install -Dm644 -t "$pkgdir"/usr/share/doc/procdump changelog
	install -Dm644 -t "$pkgdir"/usr/share/man/man1 procdump.1.gz
}

# vim: set sw=2 ts=2 et:
