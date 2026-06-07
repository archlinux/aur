# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=fencecat
pkgver="0.4.0"
pkgrel=1
pkgdesc="Walkdir cat with markdown fenced code output"
arch=('x86_64')
url="https://github.com/Xangelix/fencecat"
license=('MIT')
makedepends=('cargo-nightly' 'rust-nightly')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha512sums=('0eb21beade222f6ad0adcc9a130da75fcaea569e5218cfe0889cc40440c1d2b405f211b05f16708fe8a417dabf918105b53f1f4c83650a08d4f1dd78eff0b275')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install the binary
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # Install the documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
