pkgname=firefox-extension-dustman
pkgdesc="Automatically closes tabs"
pkgver=1.2.1
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/fr/firefox/addon/self-destructing-cookies/"
makedepends=('unzip' )
depends=("firefox")
license=('MIT')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/dustman/addon-595532-latest.xpi" )
sha512sums=('5bd8b7d81cefdf9348d180af035e13a1eddfbefa11ef40aa51d8748b7268c960e4a8430109549b6a21dcbecbb87ce4d5fd731236f6ac982dc972a287a0be5a94')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi package.json | grep -m1 version | awk -F: '{ print $2 }' | sed 's/[", ]//g'
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    
    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
