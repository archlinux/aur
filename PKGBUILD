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
sha256sums=('13ed13b7fe73a110350968313206ed3b07994330734571760254547744d35dfe')

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
