# 
# Based on PKGBUILD firefox-extension-shumway and firefox-extension-adblock-plus

_plugin_name=requestpolicy-continued
pkgname=firefox-extension-${_plugin_name}
pkgdesc="Be in control of which cross-site requests are allowed. Improve the privacy of your browsing by not letting other sites know your browsing habits. Secure yourself from Cross-Site Request Forgery (CSRF) and other attacks."
pkgver=1.0.beta12.4
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
makedepends=('unzip' )
depends=("firefox")
license=('GPL3')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/requestpolicy-continued/addon-683612-latest.xpi" )
sha1sums=('f876f1b45d8ddb299b383f94470b9ddf0ba61107')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi  install.rdf | sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}'
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    
    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
