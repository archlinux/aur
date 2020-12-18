# Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64')
url="https://github.com/FreeTubeApp/FreeTube"
file="freetube_${pkgver}_amd64.deb"
license=('GPL')
options=("!strip" "staticlibs")
source=(
    "freetube-bin.desktop"
    "freetube-bin-icon.png"
    "$pkgname-$pkgver-$pkgrel.deb"::"$url/releases/download/v$pkgver-beta/$file"
    #"$pkgname-$pkgver-$pkgrel.deb.zip"::"$url/releases/download/v$pkgver-beta/$file.zip"
    )

prepare() {
    #ar -x $file
    bsdtar -x -f data.tar.xz opt/FreeTube
}

package() {
    install -d "$pkgdir/"{usr/bin,/usr/share/pixmaps,usr/share/applications,opt}
    cp -R $srcdir/opt/FreeTube $pkgdir/opt/$pkgname
    chmod 4755 $pkgdir/opt/$pkgname/chrome-sandbox
    ln -s /opt/$pkgname/freetube $pkgdir/usr/bin/$pkgname
    install -Dm644 "freetube-bin-icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "freetube-bin.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}


md5sums=('e6ae90f67b51efc28cbc249aefc7fc28'
         '226826376032a3253ebba9f1ed2e58fd'
         'fdede99d1e2c224e3ab2c142e6f562b4')
