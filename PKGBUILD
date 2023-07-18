# Maintainer: Berin Aniesh <berinaniesh@gmail.com>
# Contributor: Berin Aniesh <berinaniesh@gmail.com>

pkgname=ucf
pkgver=0.1.4
pkgrel=1
pkgdesc='A code formatter that formats any code'
arch=('x86_64')
url=https://github.com/berinaniesh/ucf
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('python-black: for py and ipynb support'
            'clang: for C/C++ files support'
            'python-cmakelang: for cmake support'
            'go: for go support'
            'ocaml-ocamlformat: for ocaml support'
            'prettier: for html, md, js, ts etc'
            'rust: for rust files support'
            'rustup: for rust files support'
            'stylua: for lua support'
            'stylish-haksell: for haskell support'
            'taplo-cli: for toml support'
            'libxml2: for xml support'
            'zig: for zig support')
provides=("${pkgname}")
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  "$pkgname-$pkgver-LICENSE.md::https://raw.githubusercontent.com/berinaniesh/ucf/main/LICENSE"
)
b2sums=('b12199ab9dbc07d969bdc92256988d393965e0748ab0dd46faf6ffa7492a4ffa4b9f5ad476aabd4faf8f026215ec02229a86cb52ed1925736ede8bf2cbf45a14'
        'f214d2545f6b759e0320ef3d96da22d6b0a50dda95d68d293bc2e74d274018c971bccc0a5393c5a6d876556c6f45cfeab90331aa7e3d66b1cd6dc6f803d3016b')

prepare() {
  cd $pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked --offline --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/${pkgname}
  install -Dm644  ../$pkgname-$pkgver-LICENSE.md \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
