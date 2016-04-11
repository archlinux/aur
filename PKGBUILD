# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_plugin_name=feedly-notifier
pkgname=firefox-extension-${_plugin_name}
pkgver=2.10.12
pkgrel=2
pkgdesc="Firefox extension for reading news from rss aggregator Feedly."
license=('MPL 2.0')
arch=('any') 
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
depends=("firefox")
makedepends=('unzip')
source=("https://addons.cdn.mozilla.net/user-media/addons/456474/${_plugin_name/-/_}-${pkgver}-fx.xpi")
noextract=("${_plugin_name/-/_}-${pkgver}-fx.xpi")
sha256sums=('1d955cb6a82703dcd7204a8c977f0a20be168d4c0edafa900d6180c2d6d69609')

prepare(){
    unzip -qqo ${_plugin_name/-/_}-${pkgver}-fx.xpi
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
