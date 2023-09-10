# Maintainer: LitiaEeloo <litiaeeloo@gmail.com>

pkgname=charcoal
pkgver=0.2.7
pkgrel=2
pkgdesc="Charcoal, a command line dictionary"
arch=('x86_64')
reponame=charcoal
url="https://github.com/LighghtEeloo/$reponame"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

prepare() {
  # mv "$srcdir/$reponame-$pkgver" "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/charcoal" -t "$pkgdir/usr/bin"
  install -Dm 644 Readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

sha256sums=('650841927eb8db80ed2bd23442cb270260ff730ca638269341033a84758f7ef8')
