# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.10.0"
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
sha256sums=('4661bebc010209c5c3d180a8f7ad6c16b596655acf74bf459d3baf81af8589d5')
sha512sums=('22f3c3f3d4088853d42a3bce708ff2ec48f02e6280812c3825eca17b8436985f85a7bcda4c367d6994f791708c18b1bc2356b0e6b9b5e1581d1eea18efddb932')

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
