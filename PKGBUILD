# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=comrak
pkgver=0.7.1
pkgrel=1
pkgdesc='CommonMark + GFM compatible Markdown parser and renderer'
arch=('x86_64' 'i686')
url="https://github.com/kivikakk/$pkgname"
license=('MIT' 'custom')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f6334373e66c125f3bfa8e97450755fbdc88e7d8508b033328f2dfcf67c5fb1c')

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
