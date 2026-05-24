# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.16.0
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

sha256sums_x86_64=('70e49664a74374b48b51e6f3fdfbf437f6395d42509050588bd49abe52ba3d00')
sha256sums_pentium4=('4e34e279a9f856358de420490b531974c3d37f8f3707eef9f0342e92c14c301f')
sha256sums_aarch64=('ea4b09bfb22ec6f6c6ceac57ab63efb6b46e17ab08d21f69f3a48b38e1534f17')
sha256sums_armv7h=('f85116bf2f9189bb6ae280c7f92f03b89c2551a88e17881c0c2df86bf4e42c50')
sha256sums_riscv64=('bc069b0f2f568f54bafbdfc1d65b12fd386ed6a652044a37aee6a4f72f14076e')
