# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor-git
conflicts=('makoureactor')
pkgver=1.6.5.r31.gc8264a7
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt5-base' 'freeglut') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("git://github.com/myst6re/makoureactor.git#branch=develop")
md5sums=(SKIP)

pkgver() {
  cd "makoureactor"
  git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
  

build() {
  cd "makoureactor"
  #qmake-qt4 Makou_Reactor.pro #Qt4 Build
  qmake-qt5 Makou_Reactor.pro #Qt5 Build
  make
}
package(){
  cd "makoureactor"
  INSTALL_ROOT=$pkgdir make install
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/makoureactor
  install -m666 vars.cfg "$pkgdir"/usr/share/makoureactor/
}  
