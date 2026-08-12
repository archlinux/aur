# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-pgmoon' 'lua51-pgmoon' 'lua52-pgmoon' 'lua53-pgmoon' 'lua54-pgmoon')
_pkgbase='pgmoon'
pkgver=1.18.0
pkgrel=1
arch=('any')
url='https://github.com/leafo/pgmoon'
license=('MIT')
pkgdesc="PostgreSQL driver written in pure Lua"
_archive="${_pkgbase}-${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/leafo/pgmoon/archive/v$pkgver.tar.gz")

_package() {
    pkgdesc+=" for Lua ${1}"
    depends=("${pkgname%-*}" "${pkgname%-*}-lpeg")
    if [[ "$1" == "5.1" ]] ; then
        depends+=("${pkgname%-*}-bitop")
    fi
    optdepends=("${pkgname%-*}-cqueues: asynchronous connectivity"
                "${pkgname%-*}-socket: synchronous connectivity")

    cd "${_archive}"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/$1/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/$1/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-pgmoon() {
    _package 5.5
}

package_lua54-pgmoon() {
    _package 5.4
}

package_lua53-pgmoon() {
    _package 5.3
}

package_lua52-pgmoon() {
    _package 5.2
}

package_lua51-pgmoon() {
    _package 5.1
}

sha512sums=('4c2916d3ce2ced18b335c48f4efc861c0dd281d28077001c098a963fd7a18f41468e2aa5475a59e459e0d83e07d0e93c18dd7f964f2e8eeb63fb2f60d590b60e')
