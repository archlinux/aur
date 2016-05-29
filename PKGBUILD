# Maintainer: FadeMind <fademind@gmail.com>

_dver=212
pkgname=firefox-extension-mozilla-archive-format
pkgver=4.0.0
pkgrel=1
pkgdesc="Opens and saves all the Web sites in a single file. It supports MHTML (MHT) and archives MAF based on ZIP archive system."
url='https://addons.mozilla.org/firefox/addon/mozilla-archive-format/'
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('a4d4cbb5f092849cf6fbc8e8187a6bc1ad6b7b6c4923199c916ddd4948ba7e66')
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
