# Maintainer: FadeMind <fademind@gmail.com>

_plugin_name=bookmarks_checker_check_for_bad_links
pkgname=firefox-extension-bookmarks-checker
pkgver=5.8.1
pkgrel=1
pkgdesc="Check favorites for broken or bad links"
url="https://addons.mozilla.org/firefox/addon/bookmarks-checker/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/431790/${_plugin_name}-${pkgver}-fx.xpi")
sha256sums=('90162246d5fa49a58bed8390a7d5cb7d4507a3389a4edc0bbd275c6637d2d749')
noextract=("${_plugin_name}-${pkgver}.xpi")

prepare(){
    unzip -qqo ${_plugin_name}-${pkgver}.xpi
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
