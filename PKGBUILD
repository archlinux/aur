# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luasodium' 'lua51-luasodium' 'lua52-luasodium' 'lua53-luasodium')
_pkgbase='luasodium'
pkgver=1.0.4
pkgrel=2
arch=('x86_64' 'i686')
url='https://github.com/jprjr/luasodium'
license=('MIT')
depends=('libsodium')
makedepends=('cmake' 'lua' 'lua51' 'lua52' 'lua53')
source=("https://github.com/jprjr/luasodium/releases/download/v${pkgver}/luasodium-${pkgver}.tar.gz")

md5sums=('2c025429528ed82e00565d138dca2816')

build() {

    cmake -B build-lua                     -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    cmake -B build-lua51 -DLUA_VERSION=5.1 -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    cmake -B build-lua52 -DLUA_VERSION=5.2 -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"
    cmake -B build-lua53 -DLUA_VERSION=5.3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES -DCMAKE_INSTALL_PREFIX=/usr -S "${_pkgbase}-${pkgver}"

    make -C build-lua
    make -C build-lua51
    make -C build-lua52
    make -C build-lua53

}

package_lua-luasodium() {
    pkgdesc="Lua bindings for libsodium"
    depends+=('lua')

    make -C build-lua DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_lua51-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.1"
    depends+=('lua51')

    make -C build-lua51 DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.2"
    depends+=('lua52')

    make -C build-lua52 DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luasodium() {
    pkgdesc="Lua bindings for libsodium for Lua 5.3"
    depends+=('lua53')

    make -C build-lua53 DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
