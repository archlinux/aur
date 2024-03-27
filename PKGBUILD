# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
_pkgname=handyoutliner
pkgname=${_pkgname}-bin
pkgver=1.1.6.4
pkgrel=1
pkgdesc="The goal of this program is to make easier and faster the process of creating bookmarks for DjVu and PDF documents."
arch=('x86_64')
url="http://handyoutlinerfo.sourceforge.net/"
license=('GPL')
depends=('djvulibre' 'mono')
source=('https://prdownloads.sourceforge.net/sourceforge/handyoutlinerfo/handyoutliner_1.1.6.4.zip'
        'handyoutliner.desktop')
md5sums=('0fa32c26b04014f1978174a7fe87e07d'
         'cbdba92c9b16a08c8f198a0d7c2adf89')

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
