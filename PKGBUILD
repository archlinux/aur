# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.2.2
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2')
depends=(
	avahi
	cuda
	ffmpeg
	gcc-libs
	glibc
	libpulse
	nvidia-utils
	openssl
	opus
)
provides=(moonshine)
conflicts=(moonshine)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
	"moonshine.service"
)
sha256sums=('b2153632fd16fedcaea18aad9c7efafd63a95f6242b8fbf01d241e6a8b292b4c'
            'dc1d8e62f3a3d6b6af11f0c6418a29ba6889301e48d23b50d15cdde4f8e81099')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
