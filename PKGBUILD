# Maintainer: shiro <shiro@usagi.io>

pkgname=map2
pkgver=1.0.0
pkgrel=1
pkgdesc="A scripting language that allows complex key remapping on Linux, written in Rust"
arch=('x86_64' 'i686')
license=('MIT')
depends=()
makedepends=(rustup)
source=("git+https://github.com/shiro/${pkgname%-git}.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm644 docs/man/map2.1 "$pkgdir/usr/share/man/man1/map2.1"
}
