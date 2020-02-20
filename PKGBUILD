# Maintainer: Ricardo Madriz <richin13 at gmail dot com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=beefy-miracle-backgrounds
pkgver=16.91.0
_string=$(curl -sL "https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages/$(echo $pkgname | head -c 1)" | grep "${pkgname}" | cut -d '"' -f 6)
_rhver=$(echo ${_string} | sed "s/${pkgname}-//g" | sed 's/.src.rpm//g')
pkgrel=$(echo ${_rhver} | cut -d '-' -f 2| sed 's/.fc[0-9]*//g')
pkgdesc="Fedora 17 (Beefy Miracle) backgrounds."
arch=("any")
url="https://fedoraproject.org/wiki/Wallpapers#Fedora_17"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/source/tree/Packages"
source=("${_rhlink}/b/${pkgname}-${_rhver}.src.rpm")
sha256sums=('SKIP')

pkgver() {
  echo $_string | cut -d '-' -f 4
}

prepare()  {
  tar -xvJf ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}-${pkgver}.tar.xz
  rm -r ./${pkgname}.spec
}

build() {
  cd ./${pkgname}-${pkgver}
  make
}

package() {
  cd ./${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
}
# vim:set ts=2 sw=2 et:
