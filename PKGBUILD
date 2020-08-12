# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.8.0
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/$pkgname"
license=('MIT' 'custom')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('39037d7308ceeaa0fe87306b61f6e40205edf660c3e49cd6c17df3b18614a398')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --features clap
}

package () {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/$pkgname
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
