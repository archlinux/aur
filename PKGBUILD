# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=mdrv-db
pkgver=0.2.1
pkgrel=1
pkgdesc="Fjall durability envelope around a SQL data port and content-addressed blob store (fleet CLI)"
arch=('x86_64' 'aarch64')
url="https://crates.io/crates/mdrv-db"
license=('MIT')
depends=('libgcc')
makedepends=('cargo')
source=("mdrv-db-$pkgver.crate::https://static.crates.io/crates/mdrv-db/mdrv-db-$pkgver.crate")
sha256sums=('bd4d48eac4cabaa0d152ffdb9e0db30c9c40a243a99fd9cdb9fb4c907f5e8d29')
options=('!debug' '!lto')

build() {
  cd "mdrv-db-$pkgver"
  cargo build --release --locked
}

package() {
  cd "mdrv-db-$pkgver"
  install -Dm755 target/release/mdrv-db "$pkgdir/usr/bin/mdrv-db"
  ./target/release/mdrv-db completion > mdrv-db.yaml
  install -Dm644 mdrv-db.yaml "$pkgdir/usr/share/carapace/specs/mdrv-db.yaml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
