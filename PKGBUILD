# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-lualame' 'lua51-lualame' 'lua52-lualame' 'lua53-lualame' 'lua54-lualame')
_pkgbase='lualame'
pkgver=1.0.0
pkgrel=3
arch=('x86_64' 'i686' 'aarch64')
url='https://buffering.party/software/lualame/'
license=('MIT')
depends=('lame')
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

    make -C build-lua${V}-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua-lualame() {
    pkgdesc="Lua 5.5 bindings for libmp3lame"
    depends+=("lua>=${_lua_cur}" "lua<${_lua_next}")

    _package ${_lua_cur}
}

package_lua54-lualame() {
    pkgdesc="Lua 5.4 bindings for libmp4lame"
    depends+=('lua54')

    _package 5.4

}

package_lua53-lualame() {
    pkgdesc="Lua 5.3 bindings for libmp3lame"
    depends+=('lua53')

    _package 5.3

}

package_lua52-lualame() {
    pkgdesc="Lua 5.2 bindings for libmp3lame"
    depends+=('lua52')

    _package 5.2

}

package_lua51-lualame() {
    pkgdesc="Lua 5.1 bindings for libmp3lame"
    depends+=('lua51')

    _package 5.1

}

sha512sums=(
'2358e3e1dafefa4b4bd154c631bb2ca660f719204b50d81cc8e3341ab4e3804e192ce6d597dae57ee3197a70a5b317f2cc1f0e28f15443aac9a036a6a0abd493'
)
