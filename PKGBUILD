# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=firefox-extension-privacybadger
pkgver=2017.11.20
pkgrel=1
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/506646/privacy_badger-${pkgver}-an+fx.xpi")
sha256sums=('bad9c6228ac85ba4901c69d18cc81d1f6500b82e84592c21c3a9dc5b848b8765')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*"id": "\(.*\)"/{s//\1/p;q}' manifest.json) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
