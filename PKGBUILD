# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
_pkgname=handyoutliner
pkgname=${_pkgname}-bin
pkgver=1.1.6.3
pkgrel=1
pkgdesc="The goal of this program is to make easier and faster the process of creating bookmarks for DjVu and PDF documents."
arch=('x86_64')
url="http://handyoutlinerfo.sourceforge.net/"
license=('GPL')
depends=('djvulibre' 'mono')
source=('https://prdownloads.sourceforge.net/sourceforge/handyoutlinerfo/handyoutliner_1.1.6.3.zip'
        'handyoutliner.desktop')
md5sums=('51a3b3411103564b762605d8bcb17be4'
         '55f5c8fa377de829f10632a2d518d06d')

prepare() {
    cd ${_pkgname}_${pkgver}
    sed -i 's:\$(dirname \$0):/usr/lib/handyoutliner:' start-linux
    chmod +x start-linux
    rm start-macos
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/handyoutliner"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "${srcdir}/handyoutliner.desktop" "${pkgdir}/usr/share/applications/handyoutliner.desktop"
    cd ${srcdir}/${_pkgname}_${pkgver}
    cp -R * "${pkgdir}/usr/lib/handyoutliner"
    ln -s /usr/lib/handyoutliner/start-linux $pkgdir/usr/bin/handyoutliner
}
