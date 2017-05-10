# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=firefox-extension-privacybadger
pkgver=2017.4.19.1
pkgrel=1
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/506646/privacy_badger-${pkgver}-an+fx-linux.xpi")
sha256sums=('02d6d61227b8ec723e3f0ba35ace20234bb674a13767b3820d3060652be88a86')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*"id": "\(.*\)"/{s//\1/p;q}' manifest.json) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
