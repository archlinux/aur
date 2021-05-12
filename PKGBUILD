# Maintainer: zhullyb <5435486@qq.com>

pkgname=purewriter-desktop-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Never loss content editor & Markdown"
arch=('x86_64')
url="https://writer.drakeet.com/desktop"
license=('Custom')
depends=('xdg-utils' 'zlib')
source=("https://github.com/PureWriter/desktop/releases/download/$pkgver/PureWriter-$pkgver-Linux-amd64.deb"
        "purewriter.desktop")
  
md5sums=('2bf7bbe1f16332d9fc1b721f1dd0e88e'
         '286912b83356bc634b9d5d4ce4a6031d')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package() {
    cd $srcdir
    rm -r opt/pure-writer/share
    mv opt/pure-writer/bin/Pure\ Writer opt/pure-writer/bin/purewriter
    rm opt/pure-writer/lib/pure-writer-Pure_Writer.desktop
    mkdir $pkgdir/opt
    mv opt/* $pkgdir/opt/
    install -Dm644 purewriter.desktop $pkgdir/usr/share/applications/purewriter.desktop
    mkdir $pkgdir/usr/bin
    ln -s /opt/pure-writer/bin/purewriter ${pkgdir}/usr/bin/purewriter
}
