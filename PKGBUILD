# Maintainer: Rafael Carvalho <contact@rafaelrc.com>

pkgname=wayland-pipewire-idle-inhibit
pkgver=0.4.5
pkgrel=1
pkgdesc="Inhibit wayland idle when computer is playing sound"
arch=('x86_64')
url="https://github.com/rafaelrc7/wayland-pipewire-idle-inhibit"
license=('GPL-3.0-only')
depends=(gcc-libs glibc libpipewire wayland wayland-protocols)
makedepends=(cargo clang)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eae2a98597f8213ba1657528ade848d13ea39e54d994c1709fed556377c78532')

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

