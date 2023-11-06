# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=32.0.0
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
b2sums=('24e69d40386381f1473c736c2591ef2ffa90c20d2d47b9f9d35308b496163ce4804d25cf01c52411d1ab7380d8684a9c5362678dea90dc722b31b4327edd0261')

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
