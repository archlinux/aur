# Maintainer: Maciej <macrionyn@proton.me>

pkgname=sotto
pkgver=0.1.0
pkgrel=1
pkgdesc='Local speech-to-text transcription for Linux/Wayland using Whisper'
arch=('x86_64')
url="https://github.com/Maciejonos/sotto"
license=('MIT')
depends=('gtk4' 'libadwaita' 'pipewire' 'wl-clipboard')
makedepends=('cargo' 'clang')
provides=('sotto')
conflicts=('sotto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('36d9da06712ef06151b787b41e51d3c6a7a1548ce3e1c85b525c3601f760a9fb')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
