# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luaogg' 'lua51-luaogg' 'lua52-luaogg' 'lua53-luaogg' 'lua54-luaogg')
_pkgbase='luaogg'
pkgver=1.2.1
pkgrel=3
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/luaogg/'
license=('MIT')
depends=('libogg')
_lua_cur=5.5
_lua_next=5.6
makedepends=('cmake' "lua>=${_lua_cur}" "lua<${_lua_next}" 'lua51' 'lua52' 'lua53' 'lua54')
source=("${url}${_pkgbase}-${pkgver}.tar.gz")

_build() {
    LUA_V=$1
    V=${LUA_V//./}

    cmake -B build-lua$V-${pkgver}-${pkgrel} -DCMAKE_POLICY_VERSION_MINIMUM=3.10 -DLUA_VERSION=$LUA_V -DCMAKE_BUILD_TYPE=None -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    make -C build-lua$V-${pkgver}-${pkgrel}
}

build() {
    for v in 5.1 5.2 5.3 5.4 5.5 ; do
        _build $v
    done
}

_package() {
    LUA_V=$1
    V=${LUA_V//./}

    make -C build-lua$V-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-luaogg() {
    pkgdesc="Lua ${_lua_cur} bindings for libogg"
    depends+=('lua')

    _package ${_lua_cur}
}

package_lua54-luaogg() {
    pkgdesc="Lua 5.4 bindings for libogg"
    depends+=('lua54')

    _package 5.4
}

package_lua53-luaogg() {
    pkgdesc="Lua 5.3 bindings for libogg"
    depends+=('lua53')

    _package 5.3
}

package_lua52-luaogg() {
    pkgdesc="Lua 5.2 bindings for libogg"
    depends+=('lua52')

    _package 5.2
}

package_lua51-luaogg() {
    pkgdesc="Lua 5.1 bindings for libogg"
    depends+=('lua51')

    _package 5.1
}


sha512sums=(
'8c97a95064bd2dab610e34debcaee9360c65125ab08a452274bf52effc60555418d097eb13ff441a3f91c26c1c6204870e7def8d4de9ff10255062bba356f2e2'
)
