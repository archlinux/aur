# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=firegestures
_plugin_version=1.11.1
_plugin_id=6366
_plugin_ext=-fx
pkgdesc="A customizable mouse gestures extension for Firefox"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')

pkgname=firefox-extension-firegestures
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="http://www.xuldev.org/firegestures/"
depends=("firefox>=50")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
sha256sums=('ee3ac71575be99ebccb856de78212654bf8808aff2a3c8edd76eae1aa1f97ed6')

package() {
  cd "${srcdir}"
  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
