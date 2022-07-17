# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=zola
pkgver=0.16.0
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
depends=('gcc-libs')
makedepends=('cargo')
license=('MIT')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('d9e8496b88bbb69dd7b885d284f2599f50575fc7941b1bee81371b432ebc2d50')

prepare() {
  cd zola-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd zola-$pkgver
  cargo build --frozen --release
}

check() {
  cd zola-$pkgver
  cargo test --frozen
}

package() {
  cd zola-$pkgver
  install -Dm755 target/release/zola "$pkgdir"/usr/bin/zola
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
