# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.17.1
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

sha256sums_x86_64=('3581863e3cbcfd0fce0efc682ce7e9e93da96668a977791d356a26d2a7e9b17a')
sha256sums_pentium4=('0855367e096917bb0b628050d994d1871cc8c1f9192542163f9f93b6a30c9c6c')
sha256sums_aarch64=('a1546d5646eb184437918d6635ca6b762a0e889eac09cef720ee7a1ed3fe7795')
sha256sums_armv7h=('45b5262ef4d4d1e70d21683b2ef4c1b765b067f34a13e2aa57d5f92bb02382a9')
sha256sums_riscv64=('b31a3fd8b42b614cb68f93f18aab11c1721336654a9c8dd389ff7bab3a6827dc')
