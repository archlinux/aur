# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
url='https://ziglang.org/'
license=('GPL')
provides=('zig')
conflicts=('zig')
source_x86_64=("https://ziglang.org/download/$pkgver/zig-linux-x86_64-$pkgver.tar.xz")
source_pentium4=("https://ziglang.org/download/$pkgver/zig-linux-x86-$pkgver.tar.xz")
source_aarch64=("https://ziglang.org/download/$pkgver/zig-linux-aarch64-$pkgver.tar.xz")
source_armv7h=("https://ziglang.org/download/$pkgver/zig-linux-armv7a-$pkgver.tar.xz")
source_riscv64=("https://ziglang.org/download/$pkgver/zig-linux-riscv64-$pkgver.tar.xz")

package() {
	local zigarch

	case "$CARCH" in
	x86_64|aarch64|riscv64) zigarch="$CARCH" ;;
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

sha256sums_x86_64=('c7ae866b8a76a568e2d5cfd31fe89cdb629bdd161fdd5018b29a4a0a17045cad')
sha256sums_pentium4=('fb752fceb88749a80d625a6efdb23bea8208962b5150d6d14c92d20efda629a5')
sha256sums_aarch64=('754f1029484079b7e0ca3b913a0a2f2a6afd5a28990cb224fe8845e72f09de63')
sha256sums_armv7h=('b48221f4c64416d257f0f9f77d8727dccf7de92aeabe59744ee6e70d650a97bc')
sha256sums_riscv64=('bb2d1a78b01595a9c00ffd2e12ab46e32f8b6798f76aec643ff78e5b4f5c5afd')
