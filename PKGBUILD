# Maintainer: Doclic <doclic@tutanota.com>

# Based off of the zig-bin AUR package

pkgname=zig-0.10-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (v0.10.1)'
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

	install -d "$pkgdir/usr/share/doc/zig/"
	cp -r -t "$pkgdir/usr/share/doc/zig/" doc/*

	install -D -t "$pkgdir/usr/share/licenses/zig/" LICENSE
}

sha512sums_x86_64=('1cf88a492b1a47800e213b8801477f4ffabf269f960d27d1849c5aec805b5db3768c83d4daa4a738532b1b7367e8c6812e3eea47c205ea732d7a6269a47e16dc')
sha512sums_pentium4=('b507dd64baf5d7e9dcb50445e90e04170c66d6d6e6ac75af7f3d1faec7f5a035749a20dc564c5cf80e9df9a23a33c293966578a535333e21c28ce90a5babf004')
sha512sums_aarch64=('a066114a1fb947cfbacec9fcf2a0b8d11551a757b6aa9b611adc60fcc78d859866a78b17c78b0cc238aea48a87d1caeb88d26c5fd1ed45c9c3f1c563ef78d365')
sha512sums_armv7h=('37f655f7d1929baf6c4447a9dee335a34fc1df6c7305c417936335b3482c2ae8109ab29ad3b3525bd19ef4d596a2bbd7db40ebb86017c987d9974532bc5b5de6')
sha512sums_riscv64=('9bfd3818cd493dc429ef01f33a99f31fdaa55f34218f801627dbce5db8f446f47534483fc5d9e0ea8fb43616ff93cc90cdd2978f97f801729e226767d863c63f')
