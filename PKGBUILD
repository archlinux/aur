# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luaopus' 'lua51-luaopus' 'lua52-luaopus' 'lua53-luaopus')
_pkgbase='luaopus'
pkgver=1.0.0
pkgrel=2
arch=('x86_64' 'i686')
url='https://github.com/jprjr/luaopus'
license=('MIT')
depends=('opus')
makedepends=('cmake' 'lua' 'lua51' 'lua52' 'lua53')
source=("https://github.com/jprjr/luaopus/releases/download/v${pkgver}/luaopus-${pkgver}.tar.gz")

md5sums=('3d20560275bd713da0d0da5736c75c64')

build() {

    cmake -B build-lua-${pkgver}-${pkgrel}                     -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    cmake -B build-lua51-${pkgver}-${pkgrel} -DLUA_VERSION=5.1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    cmake -B build-lua52-${pkgver}-${pkgrel} -DLUA_VERSION=5.2 -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    cmake -B build-lua53-${pkgver}-${pkgrel} -DLUA_VERSION=5.3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"

    make -C build-lua-${pkgver}-${pkgrel}
    make -C build-lua51-${pkgver}-${pkgrel}
    make -C build-lua52-${pkgver}-${pkgrel}
    make -C build-lua53-${pkgver}-${pkgrel}

}

package_lua-luaopus() {
    pkgdesc="Lua bindings for libopus"
    depends+=('lua')

    make -C build-lua-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_lua51-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.1"
    depends+=('lua51')

    make -C build-lua51-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.2"
    depends+=('lua52')

    make -C build-lua52-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luaopus() {
    pkgdesc="Lua bindings for libopus for Lua 5.3"
    depends+=('lua53')

    make -C build-lua53-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
