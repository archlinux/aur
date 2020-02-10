# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-analyzer
pkgver=20200210
_pkgver='2020-02-10'
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs."
arch=('x86_64')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT' 'Apache')
makedepends=('cargo')
provides=('rust-analyzer')
conflicts=('rust-analyzer-bin' 'rust-analyzer-git' 'rust-analyzer-vscode-git')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
md5sums=('85e0ae7f6f15a2f6d1d3f5e8e8587113')

check() {
    cd "$pkgname-$_pkgver"
    cargo test --release --locked
}

pkgver() {
    echo ${_pkgver//-}
}

build() {
    cd "$pkgname-$_pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$_pkgver"

    install -Dm 755 "target/release/ra_lsp_server"  -t "$pkgdir/usr/bin/"
    install -Dm 755 "target/release/ra_cli" -t "$pkgdir/usr/bin/"

    install -Dm 644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
