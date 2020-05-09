pkgname=firefox-extension-dustman
pkgdesc="Automatically closes tabs"
pkgver=2.1.0
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/en/firefox/addon/dustman/"
makedepends=('unzip' )
depends=("firefox")
license=('MIT')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/file/780214/dustman_autoclose_tabs-${pkgver}-an+fx.xpi" )
sha512sums=('417e3be022ed33a5eead9da0d9c26d2df8a64adf763e078cd506b39b85288790b67f64a002191dcbd098f5dcb860ae03879071ce92fb712559de90c992c31a47')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi package.json | grep -m1 version | awk -F: '{ print $2 }' | sed 's/[", ]//g'
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    
    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
