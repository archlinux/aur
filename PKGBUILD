# Maintainer: FadeMind <fademind@gmail.com>

_plugin_name=mozilla_archive_format_with_mht_and_faithful_save
pkgname=firefox-extension-mozilla-archive-format
pkgver=3.1.3
pkgrel=2
pkgdesc="Opens and saves all the Web sites in a single file. It supports MHTML (MHT) and archives MAF based on ZIP archive system."
url='https://addons.mozilla.org/firefox/addon/mozilla-archive-format/'
arch=('any')
license=('MPL')
depends=('firefox')
makedepends=('unzip')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/212/${_plugin_name}-${pkgver}-sm+fx.xpi")
sha256sums=('10722f2bf472fb8885376a840507fe03fe0f88d10bd1dc1769fdf3bddc79ba87')
noextract=("${_plugin_name}-${pkgver}.xpi")

prepare(){
    unzip -qqo ${_plugin_name}-${pkgver}.xpi
}

package() {
    emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
    local dstdir=${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
    install -d ${dstdir}
    rm *.xpi
    mv * ${dstdir}
}
