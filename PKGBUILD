# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='a general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
url='https://ziglang.org/'
license=('MIT')
provides=("zig=$pkgver")
conflicts=('zig')
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

sha256sums_x86_64=('c61c5da6edeea14ca51ecd5e4520c6f4189ef5250383db33d01848293bfafe05')
sha256sums_pentium4=('dff166f25fdd06e8341d831a71211b5ba7411463a6b264bdefa8868438690b6a')
sha256sums_aarch64=('bb4a8d2ad735e7fba764c497ddf4243cb129fece4148da3222a7046d3f1f19fe')
sha256sums_armv7h=('3f4bf3b06b67d14e3f38be30798488c1abe3cf5b33de570cd0e87bbf09b978ad')
sha256sums_riscv64=('7ca7a3e621436fb31d66a253132fc39574a13d2a1b4d8458af4f2e7c6e4374fe')
