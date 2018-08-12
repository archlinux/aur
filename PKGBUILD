# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-lager
_pkgname="${pkgname/erlang-/}"
pkgver=3.6.4
pkgrel=1
pkgdesc="Erlang logging framework"
arch=("x86_64")
url=https://hex.pm/packages/lager
license=("Apache 2")
depends=("erlang-nox" "erlang-goldrush")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("6cbef7e038d772a6bf834ba7aaf55a1484a97adfe8075b4a23b0086a8fe697a8")

build() {
    cd "$srcdir" && tar xvaf contents.tar.gz

    sed -i '51,54d' rebar.config
    sed -i '8d' rebar.config.script

    rebar compile
}
    
package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"

    for i in ebin include priv src; do
        cp -R $i "$pkgdir/usr/lib/erlang/lib/$_pkgname-$pkgver"
    done

    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
