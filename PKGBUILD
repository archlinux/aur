# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-fireftp
pkgver=2.0.26
pkgrel=1
pkgdesc="A free, secure, cross-platform FTP/SFTP client for Mozilla Firefox."
url="https://addons.mozilla.org/firefox/addon/fireftp"
arch=('any')
license=('MPL')
depends=("firefox")
makedepends=('unzip')
source=(https://addons.cdn.mozilla.net/user-media/addons/684/fireftp-$pkgver-sm+fx.xpi)
sha256sums=('8b2d2c859ac4d58ec165b32cafc38134a5f69ae0c198e374e8232be8ee7ef321')
noextract=(fireftp-$pkgver-sm+fx.xpi)

prepare() {
    unzip -qqo fireftp-$pkgver-sm+fx.xpi
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
