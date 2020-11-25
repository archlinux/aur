# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.9.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/$pkgname"
license=('MIT' 'custom')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0a7c134dfe937abb40e0c681ebcb3a5a30299b93bc9b15058d24dd77a3bb61c2')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package () {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/$pkgname
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
