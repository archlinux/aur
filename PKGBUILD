# Maintainer: eNV25 <env252525@gmail.com>

pkgname=zig-bin
pkgver=0.11.0
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

sha256sums_x86_64=('2d00e789fec4f71790a6e7bf83ff91d564943c5ee843c5fd966efc474b423047')
sha256sums_pentium4=('7b0dc3e0e070ae0e0d2240b1892af6a1f9faac3516cae24e57f7a0e7b04662a8')
sha256sums_aarch64=('956eb095d8ba44ac6ebd27f7c9956e47d92937c103bf754745d0a39cdaa5d4c6')
sha256sums_armv7h=('aebe8bbeca39f13f9b7304465f9aee01ab005d243836bd40f4ec808093dccc9b')
sha256sums_riscv64=('24a478937eddb507e96d60bd4da00de9092b3f0920190eb45c4c99c946b00ed5')
