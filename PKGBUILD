# 
# Based on PKGBUILD firefox-extension-shumway and firefox-extension-adblock-plus

_plugin_name=no-coin
pkgname=firefox-extension-${_plugin_name}
pkgdesc="Stop coin miners on the web!"
pkgver=0.4.14
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
makedepends=('unzip' )
depends=("firefox")
license=('MIT/X11 License')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/file/874686/${_plugin_name}-${pkgver}-fx+tb-linux.xpi?src=api" )
md5sums=('a114ed7bfb97629eb92a4a77413e3571')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi manifest.json | grep -m1 version | awk -F: '{ print $2 }' | sed 's/[", ]//g'
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    
    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
