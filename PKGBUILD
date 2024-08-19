# Maintainer: Rafael Carvalho <contact@rafaelrc.com>

pkgname=wayland-pipewire-idle-inhibit
pkgver=0.5.2
pkgrel=1
pkgdesc="Inhibit wayland idle when computer is playing sound"
arch=('x86_64')
url="https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit"
license=('GPL-3.0-only')
depends=(gcc-libs glibc libpipewire wayland wayland-protocols)
makedepends=(cargo clang)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9797bb67ad186c2b289ed0d617bf8d40605debe40ff9b4f3e1c73ad1c0587276')

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

