# 
# Based on PKGBUILD firefox-extension-shumway and firefox-extension-adblock-plus

_plugin_name=self-destructing-cookies
pkgname=firefox-extension-${_plugin_name}
pkgdesc="Gets rid of a site's cookies and LocalStorage as soon as you close its tabs. Protects against trackers and zombie-cookies."
pkgver=0.4.12
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
makedepends=('unzip' )
depends=("firefox")
license=('GPL2')
source=("${pkgname}.xpi::https://addons.mozilla.org/firefox/downloads/latest/self-destructing-cookies/addon-415846-latest.xpi" )
sha1sums=('d40a1d9cce8d8f1fedf5b18805fe5371da7ba0ad')
noextract=("${pkgname}.xpi")

pkgver(){
    unzip -p ${pkgname}.xpi package.json | grep -m1 version | awk -F: '{ print $2 }' | sed 's/[", ]//g'
}

package(){
    srcxpi="${srcdir}/${pkgname}.xpi"
    emid=$(unzip -p "$srcxpi" install.rdf | sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}')
    
    
    install -Dm644 "$srcxpi" "${pkgdir}/usr/lib/firefox/browser/extensions/$emid.xpi"
}
