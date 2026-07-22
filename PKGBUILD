# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=54.1.0
pkgrel=1
pkgdesc="The DataFusion CLI is a command-line interactive SQL utility for executing queries against any supported data files."
url="https://github.com/apache/datafusion"
arch=(x86_64)
license=(APACHE)
options=("!lto")  # https://github.com/briansmith/ring/issues/1444
makedepends=(
  rustup
  cargo
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/apache/datafusion/archive/tags/$pkgver.tar.gz"
)
b2sums=('f9d4a214041daa223e1c93a0199d56455deb99a9ee5a3f1a9070df4f36448d1f4ced4b706660c89d5f81b2bed31307b1b8e5ee3684a5af96111bdd22d72753ce')

build() {
  cd "datafusion-tags-$pkgver/"
  cargo build -p datafusion-cli --release --locked
}

# check() {
#   cd "datafusion-tags-$pkgver"
#   cargo test --release --all-features --frozen
# }

package() {
  cd "datafusion-tags-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 {README,CHANGELOG}.md
}
