# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.6.0
pkgrel=3
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
makedepends=(clang cmake libc++ rust)
depends=(
	avahi
	cuda
	ffmpeg
	gcc-libs
	glibc
	libevdev
	libpulse
	nvidia-utils
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
sha256sums=('13015bae5fa55834e755feb54775dfbde97a477b02658fdc82ea5285a29205f6'
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
