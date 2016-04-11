# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=unmht
pkgname=firefox-extension-${_plugin_name}
pkgver=8.1.0
pkgrel=2
pkgdesc="view MHT (MHTML) web archive format files, and save complete web pages, including text and graphics, into a single MHT file"
license=('MPL')
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}"
depends=("firefox")
makedepends=('unzip')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/8051/${_plugin_name}-${pkgver}-sm+tb+fx+an.xpi")
sha256sums=('f47f77e04e9938560c50e4684557ebe4c9355b6cacea430ce91d8d16f88e85b3')
noextract=("${_plugin_name}-${pkgver}.xpi")

prepare(){
    unzip -qqo ${_plugin_name}-${pkgver}.xpi
}

package() {
    cd $srcdir
    emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
    local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
    install -d $dstdir
    rm *.xpi
    mv * $dstdir
}

