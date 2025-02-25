# Maintainer: Meir Kriheli <mkriheli@gmail.com>
pkgname=rusmux
pkgver=0.8.1
pkgrel=1
pkgdesc="tmux automation tool"
arch=("x86_64")
url="https://github.com/MeirKriheli/rusmux"
license=("MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0968e48f9b38fe7e78e42bbf84f5538feb242a399b6598e22861b44efd965d9e')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 0644 "completions/rusmux.zsh" "${pkgdir}/usr/share/zsh/site-functions/_rusmux"
  install -Dm 0644 "completions/rusmux.bash" "${pkgdir}/usr/share/bash-completion/completions/rusmux"
  install -Dm 0644 "completions/rusmux.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/rusmux.fish"
}
