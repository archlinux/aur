pkgname=yue-lua51-bin
pkgver=0.11.0
pkgrel=1
provides=(yue-lua51)
pkgdesc='Lua 5.1 bindings for Yue UI library'
arch=(x86_64 i686 armv7h aarch64)
depends=(
    gcc-libs
    glibc
    glib2
    libx11
    webkit2gtk-4.1
    gtk3
    pango
    atk
    gdk-pixbuf2
    libsoup
    fontconfig
    freetype2
)
makedepends=(
    patchelf
)
url='https://github.com/yue/yue'
license=('LGPL2.1')

source_x86_64=("https://github.com/yue/yue/releases/download/v${pkgver}/lua_yue_lua_5.1_v${pkgver}_linux_x64.zip")
source_i686=("https://github.com/yue/yue/releases/download/v${pkgver}/lua_yue_lua_5.1_v${pkgver}_linux_x86.zip")
source_armv7h=("https://github.com/yue/yue/releases/download/v${pkgver}/lua_yue_lua_5.1_v${pkgver}_linux_arm.zip")
source_aarch64=("https://github.com/yue/yue/releases/download/v${pkgver}/lua_yue_lua_5.1_v${pkgver}_linux_arm64.zip")

sha256sums_x86_64=('21473dd5f61604139b8ab749830dc6a8f87ffbab4d396018b6910cd4c144834d')
sha256sums_i686=('3eaab09295e40e1bc38e8888e47349bb8789bdd472a521e772f99737e298a634')
sha256sums_armv7h=('c08a5443675a8033498ecb3422734572d1ead3356deef13abcf3561afd4e10a1')
sha256sums_aarch64=('75e541890d8d7cdc2258f2dd7f35f8f52415541099fc813fab8025b323f923ff')

prepare() {
    echo 'Patching yue.so to make it possible to use it with newer libwebkit2gtk'
    patchelf --replace-needed libwebkit2gtk-4.0.so.37 libwebkit2gtk-4.1.so "$srcdir/yue.so"
    patchelf --replace-needed libjavascriptcoregtk-4.0.so.18 libjavascriptcoregtk-4.1.so "$srcdir/yue.so"
}

package() {
    mkdir -p "$pkgdir/usr/local/lib/lua/5.1"
    cp "$srcdir/yue.so" "$pkgdir/usr/local/lib/lua/5.1/yue.so"
}
