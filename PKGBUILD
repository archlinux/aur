# Maintainer: Rafael Carvalho <contact@rafaelrc.com>

pkgname=wayland-pipewire-idle-inhibit
pkgver=0.6.0
pkgrel=1
pkgdesc="Inhibit wayland idle when computer is playing sound"
arch=('x86_64')
url="https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit"
license=('GPL-3.0-only')
depends=(gcc-libs glibc libpipewire wayland wayland-protocols)
makedepends=(cargo clang)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99709841d92cddca7c4cb441b1490f4fc905c34b3fc0028ec208c3ea91215b2e')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/wayland-pipewire-idle-inhibit" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 wayland-pipewire-idle-inhibit.service -t "$pkgdir/usr/lib/systemd/user/"
}

