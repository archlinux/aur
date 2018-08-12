# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-meck
_pkgname="${pkgname/erlang-/}"
pkgver=0.8.12
pkgrel=1
pkgdesc="A mocking framework for Erlang"
arch=("x86_64")
url=https://hex.pm/packages/meck
license=("Apache 2.0")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("7a6ab35a42e6c846636e8ecd6fdf2cc2e3f09dbee1abb15c1a7c705c10775787")

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
