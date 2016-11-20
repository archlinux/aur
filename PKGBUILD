# Maintainer: Ecmel B. CANLIER <aur+ocemu(at)admicos.cf>
pkgname="ocemu"
pkgver=0.0
pkgrel=1
pkgdesc="OpenComputers Emulator in Lua"
arch=("any")
url="https://github.com/gamax92/OCEmu"
license=("unknown")
depends=("lua52" "lua52-filesystem" "lua52-sec" "lua52-socket")
makedepends=("git" "svn" "luarocks5.2")
source=("ocemu::git+https://github.com/gamax92/OCEmu")
md5sums=("SKIP")
install=ocemu.install

build() {
    cd "ocemu"
    make
}

package() {
    _emudir="$pkgdir/usr/share/"
    _bindir="$pkgdir/usr/bin"

    mkdir -p "$_emudir"
    mkdir -p "$_bindir"

    cp "ocemu" "$_emudir" -r

    echo "#!/bin/bash" >> "$_bindir/$pkgname"
    echo "cd /usr/share/$pkgname/src" >> "$_bindir/$pkgname"
    echo "lua5.2 boot.lua" >> "$_bindir/$pkgname"

    chmod +x "$_bindir/$pkgname"
}
