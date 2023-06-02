# Maintainer: HE Yaowen <he.yaowen@hotmail.com>

pkgname=dostron
pkgver=0.1.0
pkgrel=1
pkgdesc="An application to organise your collection of DOS programs for DOSBox."
arch=("any")
url="https://github.com/he-yaowen/dostron"
license=("GPL-3.0")
depends=("electron")
source=(https://github.com/he-yaowen/dostron/releases/download/v$pkgver/$pkgname-$pkgver-aur-$arch.tar.xz)
sha256sums=("a5887cc8ea1dd0aec5f032929a527093c6d0afc967b4088cc3871666dd0fc9df")

build() {
    mkdir -p $srcdir/opt
    mkdir -p $srcdir/usr/bin
    mkdir -p $srcdir/usr/share/applications

    tar -xvf $pkgname-$pkgver-aur-$arch.tar.xz -C $srcdir/opt

    cat > $srcdir/usr/bin/dostron <<EOF
#!/bin/bash
exec electron /opt/$pkgname-$pkgver/app.asar
EOF
    chmod +x $srcdir/usr/bin/dostron

    cat > $srcdir/usr/share/applications/$pkgname.desktop <<EOF
[Desktop Entry]
Name=Dostron
Version=$pkgver
Comment=An application to organise your collection of DOS programs for DOSBox.
Type=Application
Exec=dostron
Icon=/opt/$pkgname-$pkgver/dostron.png
Terminal=false
StartupNotify=false
Categories=Application;Game;
EOF
}
  
package() {
    cp -r $srcdir/opt $pkgdir
    cp -r $srcdir/usr $pkgdir
}