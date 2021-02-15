# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luaflac' 'lua51-luaflac' 'lua52-luaflac' 'lua53-luaflac')
_pkgbase='luaflac'
pkgver=2.0.0
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/jprjr/luaflac'
license=('MIT')
depends=('flac')
makedepends=('cmake' 'lua' 'lua51' 'lua52' 'lua53')
source=("https://github.com/jprjr/luaflac/releases/download/v${pkgver}/luaflac-${pkgver}.tar.gz")

md5sums=('c38ef7be5beec13ffe3fc8af6bbbf44f')

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

package_lua-luaflac() {
    pkgdesc="Lua bindings for libFLAC"
    depends+=('lua')

    make -C build-lua-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_lua51-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.1"
    depends+=('lua51')

    make -C build-lua51-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.2"
    depends+=('lua52')

    make -C build-lua52-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luaflac() {
    pkgdesc="Lua bindings for libFLAC for Lua 5.3"
    depends+=('lua53')

    make -C build-lua53-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
