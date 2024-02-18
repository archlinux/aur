# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.1.0
pkgrel=2
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2')
depends=(
	alsa-lib
	avahi
	ffmpeg
	gcc-libs
	glibc
	nvidia-utils
	openssl
	opus
)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
	"moonshine.service"
)
sha256sums=('c937d3956ecc4467542d0d2c919623717b4e0e14d3afb8038b55df91f2b04fb1'
            '3cf939836b683c428692c383ea43a27857c048c2625422cff3350e3ba43924a1')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm644 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
