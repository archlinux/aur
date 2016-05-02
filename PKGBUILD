# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@mutantmonkey.in>

pkgname=firefox-extension-scriptish
pkgver=0.1.11.1
pkgrel=3
pkgdesc="Firefox add-on for user scripts (fork of Greasemonkey)"
arch=('any')
url="https://addons.mozilla.org/firefox/addon/scriptish/"
license=('MIT')
depends=('firefox')
makedepends=('unzip')
conflicts=('scriptish')
replaces=('scriptish')
source=("https://addons.cdn.mozilla.net/user-media/addons/231203/scriptish-0.1.11-fx+sm.xpi")
sha256sums=('403dd50a57df9a7a9f583b2cf65beb6c2ffdb9532ecfc0c6c7e0a7778d3a6476')
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
