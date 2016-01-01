# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Based on PKGBUILD firefox-extension-video-downloadhelper

_plugin_name=nagioschecker
_plugin_version=0.16.1
pkgdesc='Plugin for firefox, statusbar indicator of the events from the network monitoring system Nagios.'
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url='https://code.google.com/p/nagioschecker/'
depends=('firefox>=3.0')
optdepends=('firefox-extension-addonbar')
source=('https://addons.mozilla.org/firefox/downloads/latest/3607/addon-3607-latest.xpi')
sha256sums=('5533542586f58b4b7f9996272afeb3d9eef6415debc7cc50a144dec4c75b7215')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
