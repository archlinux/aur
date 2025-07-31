pkgname=gmap
pkgver=0.3.2
pkgrel=1
pkgdesc="Git repository analysis tool for churn and heatmap visualization"
arch=('x86_64')
url="https://github.com/seeyebe/gmap"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/seeyebe/gmap/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  export RUSTFLAGS="-L/usr/lib -lsqlite3"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/gmap" "$pkgdir/usr/bin/gmap"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}