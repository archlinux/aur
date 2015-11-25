# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=live-http-headers
_plugin_version=0.17.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
pkgdesc="View HTTP headers of a page and while browsing."
license=('GPL2')
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/live-http-headers/'
depends=('firefox')
source=('https://addons.mozilla.org/firefox/downloads/latest/3829/addon-3829-latest.xpi')
sha256sums=('f3c8d21638f4c4ae57670dff6fe2b2abb45d221cee9053e9aa465984f9729eac')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
