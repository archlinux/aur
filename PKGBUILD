# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-taglib' 'lua51-taglib' 'lua52-taglib' 'lua53-taglib')
pkgbase='lua-taglib'
pkgdesc="Lua bindings for taglib"
pkgver=1.1.0
pkgrel=1
arch=('x86_64' 'i686')
url='https://github.com/jprjr/lua-taglib'
license=('MIT')
depends=('taglib' 'gcc-libs' 'glibc')
makedepends=('cmake' 'lua' 'lua51' 'lua52' 'lua53')
source=("https://github.com/jprjr/${pkgbase}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.gz")

sha256sums=('1a48b740e08fd718e6acef9c693df1981298bec4be52eec07bd2e1ad1a928ffa')

build() {
    local cmake_options=(
      -S "${pkgbase}-${pkgver}"
      -W no-dev
      -D CMAKE_BUILD_TYPE=None
      -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}" -B build-lua-${pkgver}-${pkgrel}
    cmake "${cmake_options[@]}" -B build-lua51-${pkgver}-${pkgrel} -DLUA_VERSION=5.1
    cmake "${cmake_options[@]}" -B build-lua52-${pkgver}-${pkgrel} -DLUA_VERSION=5.2
    cmake "${cmake_options[@]}" -B build-lua53-${pkgver}-${pkgrel} -DLUA_VERSION=5.3

    make -C build-lua-${pkgver}-${pkgrel}
    make -C build-lua51-${pkgver}-${pkgrel}
    make -C build-lua52-${pkgver}-${pkgrel}
    make -C build-lua53-${pkgver}-${pkgrel}
}

package_lua-taglib() {
    pkgdesc="Lua bindings for taglib"
    depends+=('lua')

    make -C build-lua-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_lua51-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.1"
    depends+=('lua51')

    make -C build-lua51-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.2"
    depends+=('lua52')

    make -C build-lua52-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-taglib() {
    pkgdesc="Lua bindings for taglib - Lua 5.3"
    depends+=('lua53')

    make -C build-lua53-${pkgver}-${pkgrel} DESTDIR="$pkgdir" install
    install -Dm644 "${pkgbase}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
