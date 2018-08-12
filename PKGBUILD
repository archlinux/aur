# Maintainer: Zhustec <zhustec@foxmail.com>

pkgname=erlang-yamerl
_pkgname="${pkgname/erlang-/}"
pkgver=0.7.0
pkgrel=1
pkgdesc="YAML 1.2 and JSON parser in pure Erlang"
arch=("x86_64")
url=https://hex.pm/packages/yamerl
license=("BSD 2-clause")
depends=("erlang-nox")
makedepends=("rebar")
source=("https://repo.hex.pm/tarballs/$_pkgname-$pkgver.tar")
sha256sums=("cb5a4481e2e2ad36db83bd9962153e1a9208e2b2484185e33fc2caac6a50b108")

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
