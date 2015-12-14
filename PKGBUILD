# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
_plugin_name=addonbar
_plugin_version=3.2.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=3
pkgdesc="Gives you a place to put all your add-on buttons without over-crowding the navigation bar."
license=('MIT')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/the-addon-bar/"
depends=("firefox")
source=('https://addons.cdn.mozilla.net/user-media/addons/473193/the_addon_bar_restored-3.2-fx.xpi')
sha256sums=('74120252ffa20faf827471a23f3c2f5f78db2c54afe34c1861ff605d30549e55')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
