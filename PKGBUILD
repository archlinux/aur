# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-unbound' 'lua51-unbound' 'lua52-unbound' 'lua53-unbound')
pkgbase='lua-unbound'
pkgdesc="Lua bindings to unbound"
_pkgbase='luaunbound'
pkgver=1.0.0
pkgrel=1
arch=('x86_64' 'i686')
url='https://www.zash.se/luaunbound.html'
license=('MIT')
depends=('unbound')
makedepends=('lua<5.5' 'lua51' 'lua52' 'lua53')
source=("https://code.zash.se/dl/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")

sha256sums=('6de45aa64c21cf0ecbccb734b7c1eda8873a6135bbe142fbf353f772a90750d3')

prepare() {
    sed -i 's/(LD)/(CC)/g' "${_pkgbase}-${pkgver}/GNUmakefile"
    for V in 5.1 5.2 5.3 5.4; do
        cp -r "${_pkgbase}-${pkgver}" "build-${V}"
    done
}

build() {
    for V in 5.1 5.2 5.3 5.4; do
        make -C "build-${V}" LUA_PC=lua${V}
    done
}

package_lua-unbound() {
    depends+=('lua<5.5')

    make -C "build-5.4" LUA_PC=lua DESTDIR="${pkgdir}" install
    cd "${_pkgbase}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README"
}

package_lua51-unbound() {
    pkgdesc+=" - Lua 5.1 version"
    depends+=('lua51')

    make -C "build-5.1" LUA_PC=lua5.1 DESTDIR="${pkgdir}" install
    cd "${_pkgbase}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README"
}

package_lua52-unbound() {
    pkgdesc+=" - Lua 5.2 version"
    depends+=('lua52')

    make -C "build-5.2" LUA_PC=lua5.2 DESTDIR="${pkgdir}" install
    cd "${_pkgbase}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README"
}

package_lua53-unbound() {
    pkgdesc+=" - Lua 5.3 version"
    depends+=('lua53')

    make -C "build-5.3" LUA_PC=lua5.3 DESTDIR="${pkgdir}" install
    cd "${_pkgbase}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/$pkgname/README"
}

