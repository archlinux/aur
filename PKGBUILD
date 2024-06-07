# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.13.0
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

sha256sums_x86_64=('d45312e61ebcc48032b77bc4cf7fd6915c11fa16e4aad116b66c9468211230ea')
sha256sums_pentium4=('876159cc1e15efb571e61843b39a2327f8925951d48b9a7a03048c36f72180f7')
sha256sums_aarch64=('041ac42323837eb5624068acd8b00cd5777dac4cf91179e8dad7a7e90dd0c556')
sha256sums_armv7h=('4b0550239c2cd884cc03ddeb2b9934708f4b073ad59a96fccbfe09f7e4f54233')
sha256sums_riscv64=('9f7f3c685894ff80f43eaf3cad1598f4844ac46f4308374237c7f912f7907bb3')
