# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-pgmoon' 'lua51-pgmoon' 'lua52-pgmoon' 'lua53-pgmoon' 'lua54-pgmoon')
_pkgbase='pgmoon'
pkgver=1.17.0
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

sha512sums=('ee4b1e48914bf0497e206da4b95f284a6383866cb66c551572b92b00d901fd84fcce8d0b7262c9b67712406d119891e627a3ae8454e762bce12d7b1b3a93f7b8')
