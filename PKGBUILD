# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.1.0
pkgrel=1
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
sha256sums=('SKIP'
            '564b02490e50d9d4fe2cf03e911dc5783e5d311e12155907a724361e56dfedf7')

build() {
	cd "$srcdir/moonshine-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/moonshine-$pkgver"
	install -Dm755 target/release/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
