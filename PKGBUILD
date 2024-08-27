# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=krabby-gotchi
_pkgname=Krabby-gotchi
pkgver=1.1
pkgrel=1
pkgdesc="Krab tamagotchi in your terminal"
arch=('x86_64')
url="https://github.com/DrCheeseFace/Krabby-gotchi"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('89948c9d4b0aedea0e17fc34eec0a54ded46c393f18101f446c889fc601176de3839aa16c3f7fb9cecbfa14368e074cf251a1597531736a0d6c3d90a05ffc2ca')

prepare() {
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/mrKrabs" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
