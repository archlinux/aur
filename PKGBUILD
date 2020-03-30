# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rust-analyzer
pkgver=20200330
_pkgver='2020-03-30'
pkgrel=1
pkgdesc="An experimental Rust compiler front-end for IDEs."
arch=('x86_64')
url="https://github.com/rust-analyzer/rust-analyzer"
license=('MIT' 'Apache')
makedepends=('cargo')
provides=('rust-analyzer')
conflicts=('rust-analyzer-bin' 'rust-analyzer-git' 'rust-analyzer-vscode-git')
source=("$pkgname-$_pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
md5sums=('4b175de9a0cd6030f2e1c564ec022db2')

# check() {
#     cd "$pkgname-$_pkgver"
#     cargo test --release --locked
# }

pkgver() {
    echo ${_pkgver//-}
}

build() {
    cd "$pkgname-$_pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$_pkgver"

    install -Dm 755 "target/release/rust-analyzer"  -t "$pkgdir/usr/bin/"

    install -Dm 644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
