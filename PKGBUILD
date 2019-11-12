# Maintainer: Marcs <aur (at) mg.odd.red>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Vinycius Maia <suportevg@uol.com.br>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=firefox-extension-greasemonkey
_file=3024171
pkgver=4.9
pkgrel=1
pkgdesc="Customize the way a web page displays or behaves, by using small bits of JavaScript."
arch=('any')
url="http://www.greasespot.net/"
license=('MPL')
makedepends=('jq')
depends=('firefox>=52.0')
source=("https://addons.mozilla.org/firefox/downloads/file/$_file/greasemonkey-${pkgver}-an+fx.xpi")
sha256sums=('a3c94257caa11c7ef4c9a61b2d898f82212a017aa3ab07e79bce07f98a25d4f1')

package() {
  cd ${srcdir}
  local _emid=$(cat manifest.json | jq -r '.applications.gecko.id')|| return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}

# vim:set ts=2 sw=2 et:
