# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-gen_smtp
_pkgname="${pkgname/erlang-/}"
pkgver=0.13.0
pkgrel=1
pkgdesc="A generic Erlang SMTP server/client framework"
arch=("x86_64")
url=https://hex.pm/packages/gen_smtp
license=("BSD 2-clause")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("8af8f1b4ab17ed9b7f7c5d1bd6186acb13b90486c8e4c81d44f18db7bed84cb5")

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
