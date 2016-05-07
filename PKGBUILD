# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_plugin_name=feedly-notifier
pkgname=firefox-extension-${_plugin_name}
pkgver=2.11.1
pkgrel=1
pkgdesc="Firefox extension for reading news from rss aggregator Feedly."
license=('MPL 2.0')
arch=('any') 
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
depends=("firefox")
makedepends=('unzip')
source=(https://addons.cdn.mozilla.net/user-media/addons/456474/${_plugin_name/-/_}-${pkgver}-fx.xpi)
sha256sums=('23e3d5846c6f7210a87e70407a2f0fa23db6da47b81cdde714ba0e7e1ec2fa84')
noextract=("${_plugin_name/-/_}-${pkgver}-fx.xpi")

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
