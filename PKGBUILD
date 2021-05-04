# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.10.1
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/$pkgname"
license=('MIT' 'custom')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('12df098cab1256b12367d71afa5cc10a53aa7835aebc203a937739318b138154')

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
