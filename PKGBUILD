# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=firegestures
_plugin_version=1.10.7
_plugin_ext=
pkgdesc="A customizable mouse gestures extension for Firefox"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')

pkgname=firefox-extension-firegestures
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="http://www.xuldev.org/firegestures/"
depends=("firefox>=41")
source=("https://addons.mozilla.org/firefox/downloads/latest/6366/addon-6366-latest.xpi")
sha256sums=('f9636aedd9ddf5b5c29058584a5906066b033d5bd070e3c2bd21e7f549a411b8')

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
