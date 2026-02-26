 pkgname=anitrack
  pkgver=0.1.1
  pkgrel=2
  pkgdesc="CLI/TUI companion for ani-cli with watch-progress tracking"
  arch=('x86_64')
  url="https://github.com/MiguelRegueiro/anitrack-cli"
  license=('GPL-3.0-or-later')
  depends=('ani-cli')
  makedepends=('rust')
  source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
  sha256sums=('SKIP')

  prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked
  }

  build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --frozen --release --locked
  }

  package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  }