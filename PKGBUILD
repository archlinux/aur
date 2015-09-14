# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

set -u
_plugin_name='default-fullzoom-level'
pkgname="firefox-extension-${_plugin_name}"
_filever='7.5'
pkgver='7.5.1'
pkgrel='1'
pkgdesc='Set Default FullZoom level, toolbar buttons for page zoom and text zoom.'
arch=('any')
url='https://addons.mozilla.org/firefox/addon/default-fullzoom-level'
license=('MPL')
depends=('firefox')
_verwatch=("https://addons.mozilla.org/en-us/firefox/addon/${_plugin_name}/versions/" '\s\+Version \([0-9\.]\+\)-signed</a>' 'f')
source=("https://addons.cdn.mozilla.net/user-media/addons/6965/${_plugin_name//-/_}-${_filever}-fx.xpi")
sha256sums=('dc6798d7d79401760ef4b1e06d29e432685d59f717c5ffa49619b15598b419f8')

package() {
  set -u
  local emid
  emid="$(grep -F 'urn:mozilla:install-manifest' 'install.rdf' | sed -n -e 's/^.*em:id="\([^"]\+\)".*$/\1/p')" # '
  if [[ ! "${emid}" =~ ^'{'[0-9A-Fa-f-]+'}'$ ]]; then set +u; false; fi
  local dstdir="${pkgdir}/usr/lib/firefox/browser/extensions/${emid}"
  install -d "${dstdir}"
  find . -maxdepth 1 '!' -type l -exec mv '{}' "${dstdir}" ';'
  set +u
}
set +u
