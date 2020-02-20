# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=fedorainfinity-backgrounds
pkgver=0.0.5
_string=$(curl -sL "https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/$(echo $pkgname | head -c 1)" | grep "${pkgname}" | cut -d '"' -f 6)
_rhver=$(echo ${_string} | sed "s/${pkgname}-//g" | sed 's/.src.rpm//g')
pkgrel=$(echo ${_rhver} | cut -d '-' -f 2| sed 's/.fc[0-9]*//g')
pkgdesc="Fedora 8 (Werewolf) infinity backgrounds."
arch=("i686" "x86_64")
conflicts=('infinity-background')
provides=('infinity-background')
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_8"
license=("GPL")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/f/${pkgname}-${_rhver}.src.rpm")
sha256sums=('SKIP')

pkgver() {
  echo $_string | cut -d '-' -f 3
}

prepare()  {
  tar -xvjf ./desktop-backgrounds-infinity-${pkgver}.tar.bz2
  rm -r ./desktop-backgrounds-infinity-${pkgver}.tar.bz2
  rm -r ./${pkgname}.spec
}

package() {    
  mkdir -p ${pkgdir}/usr/share/backgrounds/infinity
  mkdir -p ${pkgdir}/usr/share/gnome-background-properties
  cp -a ./desktop-backgrounds-infinity-${pkgver}/{infinity.xml,*.png} ${pkgdir}/usr/share/backgrounds/infinity/
  cp -a ./desktop-backgrounds-infinity-${pkgver}/desktop-backgrounds-infinity.xml ${pkgdir}/usr/share/gnome-background-properties/
}
# vim:set ts=2 sw=2 et:
