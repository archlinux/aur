# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_dver=49357
pkgname=firefox-extension-kwallet
pkgver=2.4.1
pkgrel=2
pkgdesc="An extension to allows Firefox to use KDE's Kwallet to store passwords"
url="https://addons.mozilla.org/firefox/addon/kde-wallet-password-integratio/"
depends=('qt4' 'firefox' 'kwalletmanager')
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/platform:2/addon-${_dver}-latest.xpi")
sha256sums=('57ab91bdd4ae1dc231551ce3e164f6a8315bb3e36d3704423e7d64625ad1fbc4')
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
