# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Pierre Dorbais <pierre at dorbais dot fr>

_dver=261959
pkgname=firefox-extension-bloody-vikings
pkgver=0.8.4
pkgrel=1
pkgdesc="Simplifies the use of temporary e-mail addresses in order to protect your real address from spam"
url="https://addons.mozilla.org/firefox/addon/bloody-vikings/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('adcecf25aec2a214cd2c1122afd77ffbd00acd74d7564fa59b9aabeb26c13f67')
noextract=(addon-${_dver}-latest.xpi)

pkgver() {
    sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' install.rdf | cut -f 1 -d-
}

prepare(){
    unzip -qqo addon-${_dver}-latest.xpi
}

package() {
    cd "$srcdir"
    emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
    local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
    install -d "$dstdir"
    rm *.xpi
    cp -dpr --no-preserve=ownership * "$dstdir"
    chmod -R 755 "$dstdir"
}
