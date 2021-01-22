# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Marcs <aur (at) mg.odd.red>
# Contributor: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Vinycius Maia <suportevg@uol.com.br>

pkgname=firefox-extension-greasemonkey
_file=3654383
pkgver=4.10
pkgrel=1
pkgdesc="Customize the way a web page displays or behaves, by using small bits of JavaScript."
arch=('any')
url="http://www.greasespot.net/"
license=('MPL')
makedepends=('jq')
depends=('firefox>=52.0')
source=("https://addons.mozilla.org/firefox/downloads/file/${_file}/greasemonkey-${pkgver}-an+fx.xpi")
sha256sums=('65026ec3aaa2d397de208cd7ad24b3cdc355f8984728ca0137fab8bcccf195b9')


package() {
  cd ${srcdir}
  local _emid=$(cat manifest.json | jq -r '.applications.gecko.id')|| return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}

# vim:set ts=2 sw=2 et:
