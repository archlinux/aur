# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
_plugin_name=addonbar
_plugin_version=3.2.9
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Gives you a place to put all your add-on buttons without over-crowding the navigation bar."
license=('MIT')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/the-addon-bar/"
depends=("firefox")
source=('https://addons.cdn.mozilla.net/user-media/addons/473193/the_addon_bar_restored-3.2.9-compat-fixed-fx.xpi')
sha256sums=('04ac402bfbd4e1c738d0f6c968d25ff9779bd20ac7e19711ba235a3a218c4da0')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
