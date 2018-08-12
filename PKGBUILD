# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-goldrush
_pkgname="${pkgname/erlang-/}"
pkgver=0.1.9
pkgrel=1
pkgdesc="Erlang event stream processor"
arch=("x86_64")
url=https://hex.pm/packages/goldrush
license=("ISC")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("99cb4128cffcb3227581e5d4d803d5413fa643f4eb96523f77d9e6937d994ceb")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz
    rebar compile
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin priv src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
