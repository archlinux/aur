# Maintainer: Yesterday17 <t@yesterday17.cn>
pkgname=assdraw
pkgver=3.0.0
pkgrel=1
pkgdesc="Tool to produce ASSA-format vector drawings"
arch=('x86_64')
url="https://github.com/Aegisub/assdraw"
depends=('wxgtk2' 'agg')

source=(
	"$pkgname::git+https://github.com/Yesterday17/assdraw.git"
)

md5sums=('SKIP')

build() {
    cd "${pkgname}"
    
    ./autogen.sh
    ./configure
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" install
    
    cd src
    install -Dm644 tsukasa.ico "$pkgdir/usr/share/icons/assdraw.ico"
    
    echo "[Desktop Entry]
Version=1.0
Type=Application

Name=ASSDraw3
Name[zh_CN]=ASSDraw3
Comment=Tool to produce ASSA-format vector drawings
Comment[zh_CN]=生成ASSA格式矢量图形的工具

Exec=assdraw %f
TryExec=assdraw
StartupNotify=true
Icon=/usr/share/icons/assdraw.ico
Terminal=false
Categories=Graphics;VectorGraphics;GTK;" > "$srcdir/assdraw.desktop"
	install -Dm644 "$srcdir/assdraw.desktop" "$pkgdir/usr/share/applications/assdraw.desktop"
}
