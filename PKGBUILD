# Maintainer: David Runge <dave@sleepmap.de>

_plugin_name=tab_tree
_plugin_version=1.4.8

pkgname=firefox-extension-tab-tree
pkgver=${_plugin_version}
pkgrel=2
pkgdesc="Tab Tree shows your tabs in the form of a tree structure. And also makes the user interface compact (optionally) to allow more space for the Web."
arch=('any')
license=('GPL3')
url="https://github.com/traxium/tabtree"
makedepends=("unzip")
depends=("firefox>=38")
source=("https://addons.mozilla.org/firefox/downloads/file/420541/${_plugin_name}-${pkgver}-fx.xpi")
sha256sums=('c5d3c1ebc40cc0d46fd3db1106cbdfdb45ebaf6118b0a6338c26cd26e99a35fb')

prepare() {
  cd "${srcdir}"
  unzip -qqo "${_plugin_name}-${pkgver}-fx.xpi" -d "${_plugin_name}-${pkgver}"
}

package() {
  cd "${srcdir}"
  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_plugin_name}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}-fx.xpi "${_extension_dest}.xpi"
}
