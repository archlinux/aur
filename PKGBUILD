# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-miniflac' 'lua51-miniflac' 'lua52-miniflac' 'lua53-miniflac')
_pkgbase='luaminiflac'
pkgdesc="Lua library for decoding FLAC files"
pkgver=1.1.1
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/jprjr/luaminiflac'
license=('MIT')
makedepends=('cmake' 'lua<5.5' 'lua51' 'lua52' 'lua53')
source=("https://github.com/jprjr/luaminiflac/releases/download/v${pkgver}/luaminiflac-${pkgver}.tar.gz")

md5sums=('b23d473490b2b562bcb3c99a96d75808')

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

package_lua-miniflac() {
    depends+=('lua')

    make -C build-lua-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_lua51-miniflac() {
    pkgdesc+=" - for Lua 5.1"
    depends+=('lua51')

    make -C build-lua51-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-miniflac() {
    pkgdesc+=" - for Lua 5.2"
    depends+=('lua52')

    make -C build-lua52-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-miniflac() {
    pkgdesc+=" - for Lua 5.3"
    depends+=('lua53')

    make -C build-lua53-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${_pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
