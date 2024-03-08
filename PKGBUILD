# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=36.0.1
pkgrel=2
pkgdesc="The DataFusion CLI is a command-line interactive SQL utility for executing queries against any supported data files."
url="https://github.com/apache/arrow-datafusion"
arch=(x86_64)
license=(APACHE)
makedepends=(
  rustup
  cargo
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/arrow-datafusion/archive/tags/$pkgver.tar.gz")
b2sums=('3cb108f63b78d74f3a8025ba17556d139367031439ca611f3d8b705c2c071630b85252d9e443ba1255f701f258d739ee7a7e241f4428b6e43642759b0d6cd3d1')

build() {
  export CARGO_TARGET_DIR=target
  cd "arrow-datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.72
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
