# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.11.1"
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
sha256sums=('34dfdc397835849bc56ac01bf45e68ee9cfc3c99609fb7b3ab02910930a8c40d')
sha512sums=('e4594690bfbe57a5a9b9af95adbfa57a60856ee2ae41cf76ddc0cad48f5d1194d420599d5fd84368b44dd7d818ad52c11160e8d92801078aee0982cbec7d529c')

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
