# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=31.0.0
pkgrel=1
pkgdesc="The DataFusion CLI is a command-line interactive SQL utility for executing queries against any supported data files."
url="https://github.com/apache/arrow-datafusion"
arch=(x86_64)
license=(APACHE)
makedepends=(
  rustup
  cargo
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/arrow-datafusion/archive/tags/$pkgver.tar.gz")
b2sums=('87c5af9b8afcd1032ab49597fae3e7c7f48654e817455307d3c305854b895462c5b35b1f998486226b943b94357d36694ac753b85e20791eba24db1ab934112f')

build() {
  export CARGO_TARGET_DIR=target
  cd "arrow-datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.70
  rustup component add rustfmt
  cargo build --release
}

#check() {
#  cd "arrow-datafusion-tags-$pkgver"
#  cargo test --frozen --all-features
#}

package() {
  cd "arrow-datafusion-tags-$pkgver/datafusion-cli"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  cd ..
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 {README,CHANGELOG}.md
}
