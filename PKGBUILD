# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=shumway
pkgname=firefox-extension-${_plugin_name}
pkgdesc="HTML5 implementation of flash for Firefox"
pkgver=0.11.622
pkgrel=2
arch=('any')
url="https://mozilla.github.io/${_plugin_name}/"
makedepends=('unzip' )
depends=("firefox>=18")
license=('MIT')
source=("${pkgname}-${pkgver}.xpi::https://mozilla.github.io/${_plugin_name}/extension/firefox/${_plugin_name}.xpi" )
sha1sums=('SKIP') # skip check because this changes rapidly
noextract=("${pkgname}-${pkgver}.xpi")

pkgver(){
    unzip -p ${pkgname}-${pkgver}.xpi content/version.txt | head -1
}

prepare(){
    unzip -qqo ${pkgname}-${pkgver}.xpi
}

package(){
    emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
    local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
    install -d $dstdir
    cp -r * $dstdir
    rm -f $dstdir/$pkgname-$pkgver.xpi
    chmod -R 755 $dstdir
}
