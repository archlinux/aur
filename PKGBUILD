# Maintainer: ventusliberum <dafeinayius@gmail.com>
pkgname=cajviewer-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Document Viewer for CAJ, KDH, NH, TEB and PDF format"
arch=("x86_64")
url="http://cajviewer.cnki.net"
license=(custom)
depends=()
provides=('cajviewer')
conflicts=('cajviewer' 'cajviewer-appimage')
source=("http://viewer.d.cnki.net/${pkgname%-*}-${pkgver%.*}-ZKFD-ZX.deb")
sha256sums=('8aef0f0736b0a5e994465c58d2638b0393bf52d6abcfce6fb91e6361d30de070')
package() {
    cd ${srcdir}
    tar -xJf data.tar.xz
    install -Dm755 opt/cajviewer/cajviewer $pkgdir/opt/cajviewer/cajviewer
    mv opt/cajviewer/libreaderex_x64.so $pkgdir/opt/cajviewer
    mv opt/cajviewer/Resource $pkgdir/opt/cajviewer
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/cajviewer/cajviewer $pkgdir/usr/bin/cajviewer
    install -Dm644 opt/cajviewer/cnki-caj.xml $pkgdir/usr/share/mime/packages/cnki-caj.xml
    install -Dm644 opt/cajviewer/cajviewer.png $pkgdir/usr/share/icons/hicolor/256x256/apps/cajviewer.png
    install -Dm644 opt/cajviewer/cajviewer.desktop $pkgdir/usr/share/applications/cajviewer.desktop
    sed -i 's,Icon=/opt/cajviewer/cajviewer.png,Icon=cajviewer,g' $pkgdir/usr/share/applications/cajviewer.desktop
    sed -i 's,Exec=/opt/cajviewer/cajviewer.sh %f,Exec=/usr/bin/cajviewer %f,g' $pkgdir/usr/share/applications/cajviewer.desktop
} 
