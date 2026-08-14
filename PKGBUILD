pkgname=mausam
pkgver=1.0.6
pkgrel=1
pkgdesc="Beautiful weather in your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/codeptor/mausam"
license=('MIT')
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codeptor/mausam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df1071446d3acfee2d77d743f7100ca64df6a2ca670e88f76a00ca9a3ad26f4b')

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
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
