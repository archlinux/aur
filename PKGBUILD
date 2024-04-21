# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine
pkgver=0.2.3
pkgrel=2
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2')
makedepends=(clang cmake rust)
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
options=(!lto)

source=(
	"https://github.com/hgaiser/moonshine/archive/refs/tags/v$pkgver.tar.gz"
	"moonshine.service"
)
sha256sums=('d5bb92bca0731a955064c62460a6e81c1d8ded969d43cc8b637e7c3c3795c52a'
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
