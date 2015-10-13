# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_plugin_name='restartless-restart'
_plugin_no='249342'
pkgname="firefox-extension-${_plugin_name}"
_filever='9'
pkgver='9.1'
pkgrel='1'
pkgdesc='add a File -> Restart menu item and a ctrl/cmd + alt + r hotkey to restart Firefox or Seamonkey'
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
license=('MIT')
depends=('firefox')
_verwatch=("https://addons.mozilla.org/en-us/firefox/addon/${_plugin_name}/versions/" '\s\+Version \([0-9\.]\+\)-signed</a>' 'f')
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_no}/${_plugin_name//-/_}-${_filever}-sm+fx+tb+fn.xpi")
sha256sums=('17ac1ecf8d6d6c2525d866a01ba8cecf78e9ccffb4327a940c9df907cf3ae774')

package() {
  set -u
  local _emid="$(sed -n -e 's:^    <id>\(.*\)</id>.*$:\1:p' 'install.rdf')"
  local _file=(*.xpi)
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
  set +u
}
set +u
