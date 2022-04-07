# Maintainer: jprjr <john@jrjrtech.com>

pkgname=(lua-readline lua51-readline lua52-readline lua53-readline)
_pkgname=readline
pkgbase=lua-readline
pkgdesc="Lua bindings to readline"
pkgver=3.0
pkgrel=1
arch=('x86_64' 'i686')
url='https://pjb.com.au/comp/lua/readline.html'
license=('MIT')
depends=('readline')
makedepends=('lua<5.5' 'lua51' 'lua52' 'lua53')
source=("https://pjb.com.au/comp/lua/${_pkgname}-${pkgver}.tar.gz")


prepare() {
    for V in 5.1 5.2 5.3 5.4; do
        cp -r "${_pkgname}-${pkgver}" "build-${V}"
    done
    head -n8 "${_pkgname}-${pkgver}/readline.lua" > LICENSE
}

build() {
    for V in 5.1 5.2 5.3 5.4; do
        cd "${srcdir}/build-${V}"
        cc $CFLAGS -fPIC -shared -o C-readline.so C-readline.c -lreadline -lhistory
    done
}

package_lua-readline() {
    depends+=('lua<5.5' 'lua-posix')

    install -Dm755 "build-5.4/C-readline.so" "$pkgdir/usr/lib/lua/5.4/C-readline.so"
    install -Dm644 "${_pkgname}-${pkgver}/readline.lua" "$pkgdir/usr/share/lua/5.4/readline.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-readline() {
    pkgdesc+=" - Lua 5.1 version"
    depends+=('lua51' 'lua51-posix')

    install -Dm644 "${_pkgname}-${pkgver}/readline.lua" "$pkgdir/usr/share/lua/5.4/readline.lua"
    install -Dm755 "build-5.1/C-readline.so" "$pkgdir/usr/lib/lua/5.1/C-readline.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-readline() {
    pkgdesc+=" - Lua 5.2 version"
    depends+=('lua52' 'lua52-posix')

    install -Dm644 "${_pkgname}-${pkgver}/readline.lua" "$pkgdir/usr/share/lua/5.4/readline.lua"
    install -Dm755 "build-5.1/C-readline.so" "$pkgdir/usr/lib/lua/5.2/C-readline.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-readline() {
    pkgdesc+=" - Lua 5.3 version"
    depends+=('lua53' 'lua53-posix')

    install -Dm644 "${_pkgname}-${pkgver}/readline.lua" "$pkgdir/usr/share/lua/5.4/readline.lua"
    install -Dm755 "build-5.1/C-readline.so" "$pkgdir/usr/lib/lua/5.3/C-readline.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('b664e872c0ad1ba71290751468af0bdb70f8a7699a0c13435d240e8ef05922e7')
