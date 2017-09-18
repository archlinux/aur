# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=firegestures
_plugin_version=1.11.1
_plugin_ext=
pkgdesc="A customizable mouse gestures extension for Firefox"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')

pkgname=firefox-extension-firegestures
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="http://www.xuldev.org/firegestures/"
depends=("firefox>=50")
makedepends=('unzip')
source=("https://addons.mozilla.org/firefox/downloads/latest/6366/addon-6366-latest.xpi")
sha256sums=('ee3ac71575be99ebccb856de78212654bf8808aff2a3c8edd76eae1aa1f97ed6')

prepare() {
  cd "${srcdir}"
  unzip -qqo "addon-6366-latest.xpi" -d "${_plugin_name}-${pkgver}"
}

package() {
  cd "${srcdir}"
  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${_plugin_name}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 "addon-6366-latest.xpi" "${_extension_dest}.xpi"
}
