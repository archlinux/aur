# Maintainer: shiro <shiro@usagi.io>

pkgname=map2
pkgver=1.0.6
pkgrel=5
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
url="https://github.com/shiro/map2-legacy"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=(rustup)
source=("https://github.com/shiro/map2-legacy/archive/$pkgver.tar.gz")
sha256sums=('ba7841c557b512f64845cd695089b08e3e67acde34c8827b4f64874c6a4c2010')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
