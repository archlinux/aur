# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor-git
conflicts=('makoureactor')
pkgver=continuous.r5.g4c8c82c
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt6-base' 'zlib' 'libff7tk') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("git://github.com/myst6re/makoureactor.git#branch=develop")
md5sums=(SKIP)

pkgver() {
  cd "makoureactor"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "makoureactor"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUNDLE_FF7TK_QM=OFF CMakeLists.txt
  make
}

package(){
  cd "makoureactor"
  make DESTDIR=$pkgdir install
  echo ?package\(makoureactor-git\):needs=\"x11\" section=\"Games/Toys\" title=\"makoureactor\" command=\"/usr/bin/Makou_Reactor\" > menu
  install -D -m644 menu "$pkgdir"/usr/share/menu/makoureactor
  install -D -m644 src/qt/images/logo-shinra.png "$pkgdir"/usr/share/pixmaps/Makou_Reactor.png
  install -D -m644 deploy/linux/Makou_Reactor.desktop "$pkgdir"/usr/share/applications/Makou_Reactor.desktop
}
