# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>

_dver=306880
pkgname=firefox-extension-keefox
pkgver=1.6.0
pkgrel=2
pkgdesc="Adds free, secure and easy to use password management features to Firefox"
url="https://addons.mozilla.org/firefox/addon/keefox/"
depends=('firefox' 'keepass-plugin-rpc')
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/platform:2/addon-${_dver}-latest.xpi")
sha256sums=('79b24492e191e112bac7fb42dfc318fe0e2fac369ab9dcb8da4534c3149f2ca4')
noextract=(addon-${_dver}-latest.xpi)

pkgver() {
    sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' install.rdf | cut -f 1 -d-
}

prepare(){
    unzip -qqo addon-${_dver}-latest.xpi
}

package() {
    cd "$srcdir"
    emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
    local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
    install -d "$dstdir"
    rm *.xpi
    cp -dpr --no-preserve=ownership * "$dstdir"
    chmod -R 755 "$dstdir"
}
