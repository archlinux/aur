# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=zephwm
pkgver=0.5.1
pkgrel=1
pkgdesc="Tiny i3-compatible tiling window manager for X11 written in Zig, using xcb directly"
arch=('x86_64' 'aarch64')
url="https://github.com/midasdf/zephwm"
license=('MIT')
depends=('libxcb')
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d312af282d25b1491441c23c286030a05003b0dae8e5e1c2713175f682df01a')

build() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build -Doptimize=ReleaseSafe -Dcpu=baseline
}

check() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build test -Dcpu=baseline
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 zig-out/bin/zephwm "$pkgdir/usr/bin/zephwm"
	install -Dm755 zig-out/bin/zephwm-msg "$pkgdir/usr/bin/zephwm-msg"
	install -Dm755 zig-out/bin/zephwm-bar "$pkgdir/usr/bin/zephwm-bar"
	install -Dm644 config/default_config "$pkgdir/usr/share/$pkgname/default_config"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
