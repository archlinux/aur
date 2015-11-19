# Maintainer: Robin Nehls <aur@manol.is>

pkgname=imunes-git
pkgver=v2.1.0
pkgrel=1
pkgdesc="Integrated Multiprotocol Network Emulator/Simulator"
arch=('i686' 'x86_64')
url="http://imunes.net/"
license=('BSD')
depends=('tk' 'tcllib' 'wireshark-gtk' 'imagemagick' 'docker' 'openvswitch' 'xterm')
makedepends=('make')
provides=('imunes')
source=('git+https://github.com/imunes/imunes.git')
sha1sums=('SKIP')
_gitname=imunes

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd $_gitname
  sed -i "s,ROOTDIR=\"/usr/local\",ROOTDIR=\"${pkgdir}/usr\"," scripts/update_version.sh
}

build() {
  echo "No Build"
  echo "${pkgdir}"
}

package() {
  cd $_gitname
  make PREFIX=${pkgdir}/usr install
}

# vim:set ts=2 sw=2 et:
