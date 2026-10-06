# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
url='https://ziglang.org/'
license=('MIT')
provides=("zig=$pkgver")
conflicts=('zig')
options=(!strip !debug)
source_x86_64=("https://ziglang.org/download/$pkgver/zig-x86_64-linux-$pkgver.tar.xz")
source_pentium4=("https://ziglang.org/download/$pkgver/zig-x86-linux-$pkgver.tar.xz")
source_aarch64=("https://ziglang.org/download/$pkgver/zig-aarch64-linux-$pkgver.tar.xz")
source_armv7h=("https://ziglang.org/download/$pkgver/zig-arm-linux-$pkgver.tar.xz")
source_riscv64=("https://ziglang.org/download/$pkgver/zig-riscv64-linux-$pkgver.tar.xz")

package() {
	local zigarch

	case "$CARCH" in
	x86_64 | aarch64 | riscv64) zigarch="$CARCH" ;;
	pentium4) zigarch='x86' ;;
	armv7h) zigarch='arm' ;;
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

sha256sums_x86_64=('1cbe9df9f27e6b78d14ccbca43b6703a404ef79ef1c463de901d7f088d4e2026')
sha256sums_pentium4=('55e39e175cd5b3098afc29ec47b2590134f5b874175369fb9ae7b8e836d7531a')
sha256sums_aarch64=('9e8d11661d4ae3bd57702a3832781e23ad151dde5798e16a5ccd503f65234ff8')
sha256sums_armv7h=('53f0045cdef7ba06da70a12b2ef654e4c5283b0139bc441aa7d84f364b46de43')
sha256sums_riscv64=('18ff032ac6cecf746a84259f6463264f13160ff88bc3b80722ce06f9479b82ed')
