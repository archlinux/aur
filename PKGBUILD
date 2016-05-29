# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_dver=60265
pkgname=firefox-extension-saved-password-editor
pkgver=2.9.6
pkgrel=2
pkgdesc="Adds the ability to create and edit entries in the password manager."
url="https://addons.mozilla.org/firefox/addon/saved-password-editor/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('8490edd12a76e838302d6fc1ff3e542ce18a17fc6ed7a08dcf39a9b55ca91409')
noextract=(addon-${_dver}-latest.xpi)

pkgver() {
    sed -n '/.*<version>\(.*\)<\/version>.*/{s//\1/p;q}' install.rdf
}

pkgdesc() {
    sed -n '/.*<description>\(.*\)<\/description>.*/{s//\1/p;q}' install.rdf
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
