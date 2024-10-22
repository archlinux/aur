# Maintainer: AlexOnex  libertarian_meme@hotmail.com
pkgname=spotify-control
pkgver=1.1.0
pkgrel=1
pkgdesc="Control Spotify from the command line"
arch=('x86_64')
url="https://github.com/AlexONEX/spotify-control"
license=('MIT')
depends=('spotify')
makedepends=('cargo')
optdepends=('libnotify: Allows the `now-playing` notification to be shown')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4d83afe787a34c10cbbdf4846c841d018cad6c6a6757ffefe048b922ce187c80')

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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Agregado para incluir la licencia
}
