# Maintainer: Jérémie Detrey <Jeremie.Detrey@loria.fr>
# Based on PKGBUILD firefox-extension-useragentswitcher

_plugin_name=tree_style_tab
_plugin_version=0.17.2016031101
_plugin_ext="-fx"
pkgdesc="Firefox extension to show tabs like a tree"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1')

pkgname=firefox-extension-tree-style-tab
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="http://piro.sakura.ne.jp/xul/_treestyletab.html.en"
depends=("firefox>=38")
source=("https://addons.mozilla.org/firefox/downloads/file/410478/${_plugin_name}-${pkgver}${_plugin_ext}.xpi")
sha256sums=('d571f6e11daaec28bf9ec77edcd6f23cfaf5e5f55cd670d63b678f69048c7747')

prepare() {
  cd "${srcdir}"
  unzip -qqo "${_plugin_name}-${pkgver}${_plugin_ext}.xpi" -d "${_plugin_name}-${pkgver}"
}

package() {
  cd "${srcdir}"
  _extension_id="$(sed -n '/.*em:id="\(.*\)".*/{s//\1/p;q}' ${_plugin_name}-${pkgver}/install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  install -Dm644 ${_plugin_name}-${pkgver}${_plugin_ext}.xpi "${_extension_dest}.xpi"
}
