# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luasodium' 'lua51-luasodium' 'lua52-luasodium' 'lua53-luasodium')
_pkgbase='luasodium'
pkgver=1.0.1
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/jprjr/luasodium'
license=('MIT')
depends=('libsodium')
makedepends=('lua' 'lua51' 'lua52' 'lua53')
source=("https://github.com/jprjr/luasodium/releases/download/v${pkgver}/luasodium-${pkgver}.tar.gz")

md5sums=('49b6a0005f883400c1b0708d078b83d7')

build() {

    cp -r "${_pkgbase}-${pkgver}" "${_pkgbase}-${pkgver}-lua5.1"
    cp -r "${_pkgbase}-${pkgver}" "${_pkgbase}-${pkgver}-lua5.2"
    cp -r "${_pkgbase}-${pkgver}" "${_pkgbase}-${pkgver}-lua5.3"

    cd "${_pkgbase}-${pkgver}"
    make LUA=lua

    cd "../${_pkgbase}-${pkgver}-lua5.1"
    make LUA=lua5.1

    cd "../${_pkgbase}-${pkgver}-lua5.2"
    make LUA=lua5.2

    cd "../${_pkgbase}-${pkgver}-lua5.3"
    make LUA=lua5.3

}

package_lua-luasodium() {
    pkgdesc="Lua bindings for libsodium"
    depends+=('lua')

    cd "${_pkgbase}-${pkgver}"

    make LUA=lua DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_lua51-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.1"
    depends+=('lua51')

    cd "${_pkgbase}-${pkgver}-lua5.1"

    make LUA=lua5.1 DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.2"
    depends+=('lua52')

    cd "${_pkgbase}-${pkgver}-lua5.2"

    make LUA=lua5.2 DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.3"
    depends+=('lua53')

    cd "${_pkgbase}-${pkgver}-lua5.3"

    make LUA=lua5.3 DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
