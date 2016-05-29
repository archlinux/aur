# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_dver=684
pkgname=firefox-extension-fireftp
pkgver=2.0.26
pkgrel=1
pkgdesc="A free, secure, cross-platform FTP/SFTP client for Mozilla Firefox"
url="https://addons.mozilla.org/firefox/addon/fireftp/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('8b2d2c859ac4d58ec165b32cafc38134a5f69ae0c198e374e8232be8ee7ef321')
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
