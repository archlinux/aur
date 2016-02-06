# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor-git
conflicts=('makoureactor')
pkgver=r403.44865a3
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt4') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("git://github.com/myst6re/makoureactor.git")
md5sums=(SKIP)

pkgver() {
  cd "makoureactor"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
  

build() {
  cd "makoureactor"
  #qmake-qt4 Black_Chocobo.pro #Qt4 Build
  qmake-qt4 Makou_Reactor.pro #Qt5 Build
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
