# Maintainer: Denis Salopek <denis.sale@gmail.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=imunes-git
pkgver=v2.4.0
pkgrel=1
pkgdesc="Integrated Multiprotocol Network Emulator/Simulator"
arch=('i686' 'x86_64')
url="http://imunes.net/"
license=('BSD')
depends=('tk' 'tcllib' 'wireshark-qt' 'imagemagick' 'docker' 'xterm')
makedepends=('make')
provides=('imunes')
source=('git+https://github.com/imunes/imunes.git'
        '0001-PKGBUILD-compat.patch')
sha1sums=('SKIP'
          '4d68f7f685222a23bb7d54d5cff78aa2da628135')
_gitname=imunes

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g')
}

prepare() {
  cd $_gitname
  patch -p1 -i $srcdir/0001-PKGBUILD-compat.patch
}

package() {
  cd $_gitname
  make PREFIX=${pkgdir}/usr REALPREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
