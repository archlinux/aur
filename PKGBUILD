# Maintainer: shiro <shiro@usagi.io>

pkgname=map2
pkgver=1.0.6
pkgrel=4
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
url="https://github.com/shiro/map2-legacy"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=(rustup)
source=("https://github.com/shiro/map2-legacy/archive/$pkgver.tar.gz")
sha256sums=('58d0cb923dfbaec580a742591c7f4c366fbb5d7adb73d5002cfcd4ed689c0ce0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
