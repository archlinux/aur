# Maintainer: Julius de Jeu <julius@asraphiel.dev>

pkgname=spotify-control
pkgver=1.0.0
pkgrel=1
pkgdesc="Control Spotify from the command line"

arch=('x86_64')
url=https://github.com/J00LZ/spotify-control
license=('MIT')
depends=('spotify')
makedepends=('cargo')
optdepends=('libnotify: Allows the `now-playing` notification to be shown')


source=("$pkgname-$pkgver.tar.gz::https://github.com/J00LZ/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9f10ecdea98d843861c8fb77cdb04dbbc979107b2e249f9d4fa0d02b4980785')

prepare() {
  	cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}


package() {
  	cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
