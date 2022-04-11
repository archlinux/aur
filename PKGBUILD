pkgname=yue-lua51-bin
pkgver=0.10.3
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

sha256sums_x86_64=('72101e4435e83e7289da609fbbc156ed222afa702334a8475ba7a5bfeb134975')
sha256sums_i686=('155bb215d8fe2d98a8828214d1f849a9d0514985e17bc832f502f47ac290882e')
sha256sums_armv7h=('05bfaaca9cb0cb2361b149b9a93a8621d3573541dca868d1ae04970166676bfb')
sha256sums_aarch64=('9473bd75531e7d9208b4172592f7a16f9547ff90d23c578ec14ac164693ab520')

prepare() {
    echo 'Patching yue.so to make it possible to use it with newer libwebkit2gtk'
    patchelf --replace-needed libwebkit2gtk-4.0.so.37 libwebkit2gtk-4.1.so "$srcdir/yue.so"
    patchelf --replace-needed libjavascriptcoregtk-4.0.so.18 libjavascriptcoregtk-4.1.so "$srcdir/yue.so"
}

package() {
    cp "$srcdir/yue.so" "$pkgdir/usr/lib/yue-lua-5.1.so"
}
