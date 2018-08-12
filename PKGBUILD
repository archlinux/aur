# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-parse_trans
_pkgname="${pkgname/erlang-/}"
pkgver=3.3.0
pkgrel=1
pkgdesc="Support library for manipulating Web protocols"
arch=("x86_64")
url=https://hex.pm/packages/parse_trans
license=("Apache 2.0")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("17ef63abde837ad30680ea7f857dd9e7ced9476cdd7b0394432af4bfc241b960")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz
    rebar compile
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin include src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
