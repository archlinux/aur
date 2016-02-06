# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor-git
conflicts=('makoureactor')
pkgver=1.6.5.r4.g311d035
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt4') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("git://github.com/myst6re/makoureactor.git#branch=develop")
md5sums=(SKIP)

pkgver() {
  cd "makoureactor"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
  

build() {
  cd "makoureactor"
  qmake-qt4 Makou_Reactor.pro #Qt4 Build
  #qmake-qt5 Makou_Reactor.pro #Qt5 Build
  make
}
package(){
  cd "makoureactor"
  install -D -m755 makoureactor "$pkgdir"/usr/bin/makoureactor
  install -D -m644 Makou_Reactor.desktop "$pkgdir"/usr/share/applications/Makou_Reactor.desktop
  install -D -m644 images/logo-shinra.png "$pkgdir"/usr/share/pixmaps/logo-shinra.png
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/makoureactor
  install -d "$pkgdir"/usr/share/makoureactor/
  cp -r *.qm "$pkgdir"/usr/share/makoureactor/
  install -m666 vars.cfg "$pkgdir"/usr/share/makoureactor/
}  
