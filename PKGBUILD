# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@mutantmonkey.in>

pkgname=firefox-extension-scriptish
pkgver=0.1.11.1
pkgrel=2
pkgdesc="Firefox add-on for user scripts (fork of Greasemonkey)"
arch=('any')
url="https://addons.mozilla.org/firefox/addon/scriptish/"
license=('MIT')
depends=('firefox')
makedepends=('unzip')
conflicts=('scriptish')
replaces=('scriptish')
source=("https://addons.cdn.mozilla.net/user-media/addons/231203/scriptish-0.1.11-fx+sm.xpi")
sha256sums=('edc002a8e44f7620b277038828a7f4e5319b0a8a6cc9a7f87f88627c96903bc9')
noextract=('scriptish-0.1.11-fx+sm.xpi')

prepare(){
    unzip -qqo scriptish-0.1.11-fx+sm.xpi
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
