# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.14.1
pkgrel=2
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
url='https://ziglang.org/'
license=('MIT')
provides=("zig=$pkgver")
conflicts=('zig')
source_x86_64=("https://ziglang.org/download/$pkgver/zig-x86_64-linux-$pkgver.tar.xz")
source_pentium4=("https://ziglang.org/download/$pkgver/zig-x86-linux-$pkgver.tar.xz")
source_aarch64=("https://ziglang.org/download/$pkgver/zig-aarch64-linux-$pkgver.tar.xz")
source_armv7h=("https://ziglang.org/download/$pkgver/zig-armv7a-linux-$pkgver.tar.xz")
source_riscv64=("https://ziglang.org/download/$pkgver/zig-riscv64-linux-$pkgver.tar.xz")

package() {
	local zigarch

	case "$CARCH" in
	x86_64 | aarch64 | riscv64) zigarch="$CARCH" ;;
	pentium4) zigarch='x86' ;;
	armv7h) zigarch='armv7a' ;;
	*) return 1 ;;
	esac

	cd "zig-$zigarch-linux-$pkgver"

	install -Dm755 -t "$pkgdir/usr/bin/" zig

	install -d "$pkgdir/usr/lib/zig/"
	cp -r -t "$pkgdir/usr/lib/zig/" lib/*

	install -d "$pkgdir/usr/include/"
	ln -srf -t "$pkgdir/usr/include/" "$pkgdir/usr/lib/zig/zig.h"

	install -D -t "$pkgdir/usr/share/doc/zig/" README.md
	cp -r -t "$pkgdir/usr/share/doc/zig/" doc/*

	install -D -t "$pkgdir/usr/share/licenses/zig/" LICENSE
}

sha256sums_x86_64=('24aeeec8af16c381934a6cd7d95c807a8cb2cf7df9fa40d359aa884195c4716c')
sha256sums_pentium4=('4bce6347fa112247443cb0952c19e560d1f90b910506cf895fd07a7b8d1c4a76')
sha256sums_aarch64=('f7a654acc967864f7a050ddacfaa778c7504a0eca8d2b678839c21eea47c992b')
sha256sums_armv7h=('1b34d9ecfaeb3b360e86c0bc233e1a8a2bbed2d40f2d4f20c12bde2128714324')
sha256sums_riscv64=('005f214f74dbafb7b4d8bd305f4e9d25048f711d9ec6fa7b3d4fca177e11b882')
