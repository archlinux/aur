# Maintainer: Oleg Shparber <trollixx+aur@gmail.com>
# Contributor: Thaodan <theodorstormgrade@gmail.com>

_pkgname=wargus
pkgname=$_pkgname-bzr
pkgver=r1757
pkgrel=2
pkgdesc="Warcraft 2 Mod that allows you to play Warcraft2 with the Stratagus engine"
arch=("i686" "x86_64")
url="https://launchpad.net/wargus"
license=('GPL')
makedepends=('bzr')
depends=('stratagus-bzr' 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' )
conflicts=$_pkgname
provides=$_pkgname
source=("${pkgname%-*}::bzr+http://bazaar.launchpad.net/~stratagus/wargus/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s" "$(bzr revno)"
}

build() {
  cd $srcdir
  mkdir -p build
  cd build

  cmake ../${pkgname%-*} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin

  make 
}

package()  {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}

