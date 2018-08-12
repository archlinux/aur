# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-recon
_pkgname="${pkgname/erlang-/}"
pkgver=2.3.6
pkgrel=1
pkgdesc="Diagnostic tools for production use"
arch=("x86_64")
url=https://hex.pm/packages/recon
license=("BSD")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("f55198650a8ec01d3efc04797abe550c7d023e7ff8b509f373cf933032049bd8")

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
