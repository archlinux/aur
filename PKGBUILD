# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luaopus' 'lua51-luaopus' 'lua52-luaopus' 'lua53-luaopus' 'lua54-luaopus')
_pkgbase='luaopus'
pkgver=1.0.1
pkgrel=3
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/luaopus/'
license=('MIT')
depends=('opus')
_lua_current=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_current}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=("${url}luaopus-${pkgver}.tar.gz")

_build() {
    LUA_VERSION=$1
    LUA_V="${LUA_VERSION//./}"

    cmake -B build-lua${LUA_V}-${pkgver}-${pkgrel} -DLUA_VERSION=$LUA_VERSION -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -S "${_pkgbase}-${pkgver}"
    make -C build-lua${LUA_V}-${pkgver}-${pkgrel}
}

build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build "$v"
    done
}

_package() {
    LUA_VERSION=$1
    LUA_V="${LUA_VERSION//./}"

    make -C build-lua${LUA_V}-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-luaopus() {
    pkgdesc="Lua bindings for libopus"
    depends+=("lua>=${_lua_current}" "lua<${_lua_next}")

    _package $_lua_current
}

package_lua51-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.1"
    depends+=('lua51')

    _package 5.1
}

package_lua52-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.2"
    depends+=('lua52')

    _package 5.2
}

package_lua53-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.3"
    depends+=('lua53')

    _package 5.3
}

package_lua54-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.4"
    depends+=('lua54')

    _package 5.4
}

sha512sums=(
'1c2af1741a4add34046042eeeaa8801feab9830b740a19a8db0e7a65e2b2a411e9e1d0a9869ae3bb78dcbd98ff63250d1b7f692d9f070baa9ea686257b4435ab'
)
