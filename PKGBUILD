# Maintainer: Rafael Carvalho <contact@rafaelrc.com>

pkgname=wayland-pipewire-idle-inhibit
pkgver=0.5.0
pkgrel=2
pkgdesc="Inhibit wayland idle when computer is playing sound"
arch=('x86_64')
url="https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit"
license=('GPL-3.0-only')
depends=(gcc-libs glibc libpipewire wayland wayland-protocols)
makedepends=(cargo clang)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b7a1707861a3eefbaf93a5a4200ba8420998d80cb4c99777bbfa2d0a0a1dd71')

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

