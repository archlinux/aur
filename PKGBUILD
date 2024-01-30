# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=35.0.0
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
b2sums=('a536a005e34548320ce48f6b280acbe3aa751716e292263caf7fd8bf2218036ebd3cfe683ce6191d59eca26f1258df6d8a3ff4786cc9c339ebd850c747067f38')

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
