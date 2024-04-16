# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=37.0.0
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
b2sums=('51432057023a618834ffff257e139c5627092a33246847ab8f4c6dcad2bfab6f20f71e60b1ed429291d97bc365a18ac150b6c2f17c0886aea29dc2d7e2e8c1fa')

build() {
  export CARGO_TARGET_DIR=target
  # export CARGO_PROFILE_RELEASE_LTO=false
  # export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
  cd "arrow-datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.73
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
