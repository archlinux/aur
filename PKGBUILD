# Maintainer: Marcs <aur (at) mg.odd.red>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Vinycius Maia <suportevg@uol.com.br>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=firefox-extension-greasemonkey
_file=965808
pkgver=4.7
pkgrel=1
pkgdesc="Customize the way a web page displays or behaves, by using small bits of JavaScript."
arch=('any')
url="http://www.greasespot.net/"
license=('MPL')
makedepends=('jq')
depends=('firefox>=52.0')
source=("https://addons.mozilla.org/firefox/downloads/file/$_file/greasemonkey-$pkgver-an+fx-linux.xpi")
sha256sums=('10c5e35e15e3737fb83d62bd7e2b85e64fa36d34eaf1607855a9261f61447917')

package() {
  cd ${srcdir}
  local _emid=$(cat manifest.json | jq -r '.applications.gecko.id')|| return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}

# vim:set ts=2 sw=2 et:

