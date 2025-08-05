# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>

pkgname=gleam
pkgver="1.12.0"
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
sha256sums=('5ea236d1eacbdf06922f99fc2c06acb0fb50c7dae713ac3106b9fabd51744a7c')
sha512sums=('76e87c70a4592de4de69d4f22bbf00be1c1a8e0fa0e0a598014feac070f4776220c8d2d6222b19af1a8c9607c45f795dc24b760576c76911767071894c57e4b1')

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
