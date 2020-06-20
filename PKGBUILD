# $Id$
# Maintainer: Cobalt Space <cobaltspace at protonmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=waves-backgrounds
_pkgname=desktop-backgrounds
pkgver=32.0.0
_string=$(curl -sL "https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/d" | grep "${_pkgname}" | cut -d '"' -f 6)
_rhver=$(echo ${_string} | sed "s/${_pkgname}-//g" | sed 's/.src.rpm//g')
pkgrel=$(echo ${_rhver} | cut -d '-' -f 2 | sed 's/.fc[0-9]*//g')
pkgdesc="Fedora 9 (Sulphur) waves backgrounds."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_9"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/d/desktop-backgrounds-${_rhver}.src.rpm")
sha256sums=('SKIP')

pkgver() {
  echo $_string | cut -d '-' -f 3
}

prepare()  {
  tar -xvjf ./waves-0.1.2.tar.bz2
  rm -r ./waves-0.1.2.tar.bz2
}

package() {    
  mkdir -p ${pkgdir}/usr/share/backgrounds/waves
  mkdir -p ${pkgdir}/usr/share/gnome-background-properties
  cp -a ./waves-0.1.2/{waves.xml,*.png}             ${pkgdir}/usr/share/backgrounds/waves/
  cp -a ./waves-0.1.2/desktop-backgrounds-waves.xml ${pkgdir}/usr/share/gnome-background-properties/
}
# vim:set ts=2 sw=2 et:
