# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.7.0
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake libc++ rust)
depends=(
	avahi
	gcc-libs
	glib2
	glibc
	gstreamer
	gst-plugins-base-libs
	libevdev
	libpulse
	openssl
	opus
)
provides=(moonshine)
conflicts=(moonshine)
options=(!lto)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
	"moonshine.service"
)
sha256sums=('a41ba70be1c3d141c2cba3377c48e09719968b0db3113869a3d88df195952d7d'
            '4e4d23f15633c14be1b1497efec7a8816dd48bcd9a08876963919c5aab0866fb')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
