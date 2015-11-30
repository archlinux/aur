# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=firefox-extension-speed-dial
pkgver=0.9.6.18
pkgrel=1
pkgdesc="Firefox extension that simplifies the access to your most visited websites"
arch=('any')
url="http://speeddial.uworks.net/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('firefox')
conflicts=('firefox-speed-dial')
replaces=('firefox-speed-dial')
source=("https://addons.mozilla.org/firefox/downloads/file/350702/speed_dial-${pkgver}-sm.xpi")
md5sums=('12637f01584befe2468a39d6fa335869')

package() {
  cd $srcdir
  local _emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  test ! -z "${_emid}"
  local _file=(*.xpi)
  test "${#_file[@]}" -eq 1
  install -Dpm644 "${_file}" "${pkgdir}/usr/lib/firefox/browser/extensions/${_emid}.xpi"
}
