# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-bear
_pkgname="${pkgname/erlang-/}"
pkgver=0.8.7
pkgrel=1
pkgdesc="A set of statistics functions for erlang"
arch=("x86_64")
url=https://hex.pm/packages/bear
license=("Apache 2.0")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("534217dce6a719d59e54fb0eb7a367900dbfc5f85757e8c1f94269df383f6d9b")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz
    rebar compile
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
