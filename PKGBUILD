# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.15.2
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

sha256sums_x86_64=('02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239')
sha256sums_pentium4=('4c6e23f39daa305e274197bfdff0d56ffd1750fc1de226ae10505c0eff52d7a5')
sha256sums_aarch64=('958ed7d1e00d0ea76590d27666efbf7a932281b3d7ba0c6b01b0ff26498f667f')
sha256sums_armv7h=('7d8401495065dae45d6249c68d5faf10508f8203c86362ccb698aeaafc66b7cd')
sha256sums_riscv64=('493512bdca485be3c6a9b0f69dcb4cbe4587f3af8e1be282fdd827108ba39930')
