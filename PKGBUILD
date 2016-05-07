# Maintainer: FadeMind <fademind@gmail.com>

_plugin_name=mozilla_archive_format_with_mht_and_faithful_save
pkgname=firefox-extension-mozilla-archive-format
pkgver=4.0.0
pkgrel=1
pkgdesc="Opens and saves all the Web sites in a single file. It supports MHTML (MHT) and archives MAF based on ZIP archive system."
url='https://addons.mozilla.org/firefox/addon/mozilla-archive-format/'
arch=('any')
license=('MPL')
depends=('firefox')
makedepends=('unzip')
source=(https://addons.cdn.mozilla.net/user-media/addons/212/${_plugin_name}-${pkgver}-sm+fx.xpi)
sha256sums=('a4d4cbb5f092849cf6fbc8e8187a6bc1ad6b7b6c4923199c916ddd4948ba7e66')
noextract=("${_plugin_name}-${pkgver}.xpi")

prepare(){
    unzip -qqo ${_plugin_name}-${pkgver}-sm+fx.xpi
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
