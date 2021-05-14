# Maintainer: shiro <shiro@usagi.io>

pkgname=map2
pkgver=1.0.5
pkgrel=1
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
url="https://github.com/shiro/map2"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=(rustup)
source=("https://github.com/shiro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('257da761876ce2f138b340ba2e48092be6a36206820334118c6e225b870ef8da')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
