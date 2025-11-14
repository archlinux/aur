# Maintainer: Berin Aniesh <berinaniesh@gmail.com>
# Contributor: Berin Aniesh <berinaniesh@gmail.com>

pkgname=ucf
pkgver=0.1.6
pkgrel=1
pkgdesc='A code formatter that formats any code'
arch=('x86_64')
url=https://github.com/berinaniesh/ucf
license=('MIT')
depends=('gcc-libs')
optdepends=('black: python files'
            'clang-format: java, c, c++, json files'
            'cmake-format: cmake files'
            'go: go-fmt for go files'
            'ocamlformat: ocaml files'
            'prettier: html, md, js files'
            'rustfmt: rs files'
            'shfmt: sh, ebuild files'
            'stylish-haskell: hs files'
            'stylua: lua files'
            'taplo: toml files'
            'xmllint: xml files'
            'zig: zig fmt for zig files'
    	    'tex-fmt: latex files')
makedepends=('cargo')
provides=("${pkgname}")
options=('!lto')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
  "$pkgname-$pkgver-LICENSE.md::https://raw.githubusercontent.com/berinaniesh/ucf/main/LICENSE"
)
b2sums=('879b97a01deec2e31fa7c1df166369be8e8e24c7f8f107649120df70ecd94195ae05a5e24c73fce3b4bee81f244833c9c37e318898fd0248dd4668fd2b94a081'
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
