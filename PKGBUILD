# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=zola
pkgver=0.16.1
pkgrel=1
pkgdesc="An opinionated static site generator"
arch=('x86_64')
url="https://github.com/getzola/zola"
depends=('gcc-libs')
makedepends=('cargo')
license=('MIT')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getzola/zola/archive/v${pkgver}.tar.gz")
sha256sums=('c153fd0cc1435930a4871165e6ad4865e3528465f3f41d0671a9837121688ac7')

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
  install -Dm644 completions/zola.bash "$pkgdir"/usr/share/bash-completion/completions/$pkgname.bash
  install -Dm644 completions/zola.fish "$pkgdir"/usr/share/fish/vendor_completions.d/$pkgname.fish
  install -Dm644 completions/_zola "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
}

# vim:set ts=2 sw=2 et:
