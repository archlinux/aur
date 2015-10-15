# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_plugin_name='textarea-cache'
_plugin_no='258470'
pkgname="firefox-extension-${_plugin_name}"
_filever='0.9.3.2'
_applist='fx'
pkgver='0.9.3.2.1'
pkgrel='1'
#https://addons.mozilla.org/firefox/downloads/file/258470/textarea_cache-0.9.3.2-fx.xpi?src=dp-btn-version
pkgdesc='Save automatically the content in Textarea'
arch=('any')
url="https://addons.mozilla.org/firefox/addon/${_plugin_name}/"
license=('MPL')
depends=('firefox')
_verwatch=("https://addons.mozilla.org/en-us/firefox/addon/${_plugin_name}/versions/" '\s\+Version \([0-9\.]\+\)-signed</a>' 'f')
source=("https://addons.mozilla.org/firefox/downloads/file/${_plugin_no}/${_plugin_name//-/_}-${_filever}-${_applist}.xpi")
#source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_no}/${_plugin_name//-/_}-${_filever}-${_applist}.xpi")
sha256sums=('4b31d8ae8e3bd79843b43af6619fa4dba7751abb363649696e80b07837267b14')

package() {
  set -u
  #local _emid="$(sed -n -e 's:^    <id>\(.*\)</id>.*$:\1:p' 'install.rdf')"
  local _emid="$(sed -n -e 's@^\s\+<em:id>\({[a-fA-F0-9-]\+}\)</em:id>.*$@\1@p' 'install.rdf' | head -1)"
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
  set +u
}
set +u
