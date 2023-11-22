# Maintainer: shiro <shiro@usagi.io>

pkgname=map2
pkgver=1.0.6
pkgrel=8
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
url="https://github.com/shiro/map2-legacy"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=(rustup)
source=("https://github.com/shiro/$pkgname-legacy/archive/$pkgver.tar.gz")
sha256sums=('a1e815bd24db2f63909d25e763e63ec32e719116cf749acd623fb5ad3fad6ff4')

build() {
  cd "$pkgname-legacy-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-legacy-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
