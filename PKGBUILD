# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=firefox-extension-privacybadger
pkgver=2017.1.26.1
pkgrel=1
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/506646/privacy_badger-${pkgver}-an+fx.xpi")
sha256sums=('fa52594f83e0b3a4a2e006a42afc181c0178020ef7934829c643f3e54a6fd801')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*"id": "\(.*\)"/{s//\1/p;q}' manifest.json) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
