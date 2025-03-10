# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
url='https://ziglang.org/'
license=('MIT')
provides=("zig=$pkgver")
conflicts=('zig')
source_x86_64=("https://ziglang.org/download/$pkgver/zig-linux-x86_64-$pkgver.tar.xz")
source_pentium4=("https://ziglang.org/download/$pkgver/zig-linux-x86-$pkgver.tar.xz")
source_aarch64=("https://ziglang.org/download/$pkgver/zig-linux-aarch64-$pkgver.tar.xz")
source_armv7h=("https://ziglang.org/download/$pkgver/zig-linux-armv7a-$pkgver.tar.xz")
source_riscv64=("https://ziglang.org/download/$pkgver/zig-linux-riscv64-$pkgver.tar.xz")

package() {
	local zigarch

	case "$CARCH" in
	x86_64 | aarch64 | riscv64) zigarch="$CARCH" ;;
	pentium4) zigarch='x86' ;;
	armv7h) zigarch='armv7a' ;;
	*) return 1 ;;
	esac

	cd "zig-linux-$zigarch-$pkgver"

	install -Dm755 -t "$pkgdir/usr/bin/" zig

	install -d "$pkgdir/usr/lib/zig/"
	cp -r -t "$pkgdir/usr/lib/zig/" lib/*

	install -d "$pkgdir/usr/include/"
	ln -srf -t "$pkgdir/usr/include/" "$pkgdir/usr/lib/zig/zig.h"

	install -D -t "$pkgdir/usr/share/doc/zig/" README.md
	cp -r -t "$pkgdir/usr/share/doc/zig/" doc/*

	install -D -t "$pkgdir/usr/share/licenses/zig/" LICENSE
}

sha256sums_x86_64=('473ec26806133cf4d1918caf1a410f8403a13d979726a9045b421b685031a982')
sha256sums_pentium4=('55d1ba21de5109686ffa675b9cc1dd66930093c202995a637ce3e397816e4c08')
sha256sums_aarch64=('ab64e3ea277f6fc5f3d723dcd95d9ce1ab282c8ed0f431b4de880d30df891e4f')
sha256sums_armv7h=('a67dbfa9bdf769228ec994f2098698c619f930883ca5ef638f50eee2d7788d10')
sha256sums_riscv64=('a2b14d3de326d3fd095548ef38bf5a67b15dadd62fbcc90836d63cc4355f8ef7')
