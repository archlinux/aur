# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Pierre Dorbais <pierre at dorbais dot fr>

_plugin_name=bloody-vikings
pkgname=firefox-extension-${_plugin_name}
pkgver=0.8.2
pkgrel=1
pkgdesc="Simplifies the use of temporary e-mail addresses in order to protect your real address from spam"
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
license=('GPL3')
depends=('firefox')
makedepends=('unzip')
source=("https://addons.cdn.mozilla.net/user-media/addons/261959/${_plugin_name/-/_}-${pkgver}-fx.xpi")
noextract=("${_plugin_name/-/_}-${pkgver}-fx.xpi")
sha256sums=('ef8a1b1d7a10e9e933ca730d73df6f75c0d93956f289cb4d5576052f9ab92bc1')

prepare(){
    unzip -qqo ${_plugin_name/-/_}-${pkgver}-fx.xpi
}

package() { 
    local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
    local dstdir=${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    [ -n ${emid} ] || return 1
    install -d ${dstdir}
    cp -R * ${dstdir}
    rm ${dstdir}/*.xpi
    find ${pkgdir} -type d -exec chmod 0755 {} \;
    find ${pkgdir} -type f -exec chmod 0644 {} \;
}
