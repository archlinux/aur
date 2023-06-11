# Maintainer: HE Yaowen <he.yaowen@hotmail.com>

pkgname=suikoden-ency
pkgver=1.0.0
pkgrel=1
pkgdesc="An encyclopedia for video game Suikoden: Tenmei No Chikai."
arch=("any")
url="https://github.com/he-yaowen/suikoden-ency"
license=("GPL-3.0")
depends=("electron")
source=(https://github.com/he-yaowen/suikoden-ency/releases/download/v$pkgver/$pkgname-$pkgver-asar.tar.xz)
sha256sums=("c2cb9f032836c1227c5cf87b16d6f61526448566cde7e9ee0b4fd0f6c07b4d62")

build() {
    mkdir -p $srcdir/opt
    mkdir -p $srcdir/usr/bin
    mkdir -p $srcdir/usr/share/applications

    tar -xvf $pkgname-$pkgver-asar.tar.xz -C $srcdir/opt

    cat > $srcdir/usr/bin/$pkgname <<EOF
#!/bin/bash
exec electron /opt/$pkgname-$pkgver/app.asar
EOF
    chmod +x $srcdir/usr/bin/$pkgname

    cat > $srcdir/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Name=Suikoden: Encyclopedia
Version=$pkgver
Comment=An encyclopedia for video game Suikoden: Tenmei No Chikai.
Type=Application
Exec=$pkgname
Icon=/opt/$pkgname-$pkgver/icon.png
Terminal=false
StartupNotify=false
Categories=Application;Game;
EOF
}
  
package() {
    cp -r $srcdir/opt $pkgdir
    cp -r $srcdir/usr $pkgdir
}
