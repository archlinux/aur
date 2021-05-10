# Maintainer: shiro <shiro@usagi.io>

pkgname=map2
pkgver=1.0.0
pkgrel=1
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=(rustup)
source=("https://github.com/shiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b54792808fae803a553de13bc6fa9f681406e75ba229a50fbdbe0ce6b7acfbfd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
