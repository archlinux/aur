# Maintainer: FadeMind <fademind@gmail.com>

_plugin_name=mozilla_archive_format_with_mht_and_faithful_save
pkgname=firefox-extension-mozilla-archive-format
pkgver=3.1.0
pkgrel=1
pkgdesc="Opens and saves all the Web sites in a single file. It supports MHTML (MHT) and archives MAF based on ZIP archive system."
url='https://addons.mozilla.org/firefox/addon/mozilla-archive-format/'
arch=('any')
license=('MPL')
depends=('firefox')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/212/${_plugin_name}-${pkgver}-sm+fx.xpi")
sha256sums=('52f6c3851024ddc357a256461f4da5446a3a70a28e5d112529dd651a8ae99549')

package() {
  cd ${srcdir}
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
  install -d ${dstdir}
  rm *.xpi
  mv * ${dstdir}
}
