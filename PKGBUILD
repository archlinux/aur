# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=firefox-extension-privacybadger
pkgver=1.0.5
pkgrel=1
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/506646/privacy_badger-1.0.5-fx.xpi")
sha256sums=('fa2a143ffac744187b2e45c449a1cdb892c0863a6667d39308d4d08bc5efc249')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
