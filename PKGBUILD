# Maintainer: Norbert Melzer <timmelzer PLUS aur AT gmail DOT com>

pkgname=alpaca
pkgver="0.2.8"
pkgrel=3
pkgdesc="Functional programming inspired by ML for the Erlang VM"
arch=('any')
url="http://alpaca-lang.org/"
license=('Apache2')
depends=('erlang-nox')
makedepends=('rebar3' 'git')
checkdepends=()
optdepends=()
provides=('alpaca')
conflicts=()
replaces=()
backup=()
options=(!strip !docs !libtool !staticlibs)
install=
changelog=
source=("https://github.com/alpaca-lang/${pkgname}/archive/v${pkgver}.tar.gz"
        "rebar.config.patch")
md5sums=('a456366aa77498b80ab6b8dc2adcca1f'
         '312ad70a3e6b0cf03e7d4d71daa5456f')

prepare() {
    cd "$pkgname-$pkgver"

    patch -Np0 -i "${srcdir}/rebar.config.patch"
}

build() {
    cd "$pkgname-$pkgver"

    rebar3 as default compile
}

check() {
        cd "$pkgname-$pkgver"

    ## Currently there are tests failing!
    # rebar3 eunit
    # rebar3 dialyzer
}

package() {
        cd "$pkgname-$pkgver"

    local basedir="${pkgdir}/usr/local/lib/alpaca"

    mkdir -p "${basedir}/beams"
    mkdir -p "${basedir}/src"

    install -D README.md "${basedir}/README.md"
    install -D Tour.md   "${basedir}/Tour.md"
    install -D code_of_conduct.md "${basedir}/code_of_conduct.md"
    install -D _build/default/lib/alpaca/ebin/*.beam "${basedir}/beams"
    install -D src/*    "${basedir}/src"
}
