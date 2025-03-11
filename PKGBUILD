# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.9.1"
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
sha256sums=('eacf88d2ce6f7ca06e9a0d6b8117c517a8a21593349233edb2506263d08a830f')
sha512sums=('150620d85c84bd27bee85c120c431ba6c7b5b46f93a581a8767e1cd357c529136fe19fb2ef015e61caa8c01b8ce9b978004eaaa9a1e206782facf37dcbec4908')

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
