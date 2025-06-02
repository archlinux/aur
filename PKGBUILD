# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.11.0"
pkgrel=1
pkgdesc="A friendly language for building type-safe, scalable systems!"
arch=('any')
url="http://github.com/gleam-lang/gleam"
license=('Apache2')
depends=('erlang-core' 'erlang-eunit')
optdepends=('rebar3: erlang dependency support'
            'erlang: standard erlang distribution')
makedepends=('rust')
provides=('gleam')
options=(strip !docs !libtool !staticlibs !lto)
source=("https://github.com/gleam-lang/gleam/archive/v${pkgver}.tar.gz")
sha256sums=('92141dd13b8dbe279abb3b3ef89ee15e7a960a17b2da18e9a7d079f1552e47a7')
sha512sums=('b01f7b612525fec9b6989521d5ee479709e374e894a63d09804d9cc4a5a3e2d0729aafd5b2266324ad115860a13a9566b9c46aac461c07859e6897932526c0eb')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    local basedir="${pkgdir}/usr/bin"
    install -Dm755 "target/release/gleam" "${basedir}/gleam"
}
