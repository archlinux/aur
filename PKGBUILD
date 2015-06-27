# Maintainer: Vincent Prelat <prelatv [at] gmail.com>

pkgname=qmagneto-bzr
pkgver=r228
pkgrel=2
pkgdesc="French TV guide with record function"
url="https://launchpad.net/qmagneto"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4')
makedepends=('bzr')
replaces=('qmagneto')
source=(bzr+lp:qmagneto)
md5sums=('SKIP')

pkgver() {
  cd qmagneto

  echo "r$(bzr revno)"
}


build() {
  cd qmagneto
  
  qmake-qt4 || return 1
  make || return 1
  
}

package() {
  cd qmagneto
  
  #binary file
  install -d "$pkgdir/usr/"
  install -d "$pkgdir/usr/bin"
  install -m 755 "bin/qmagneto" "$pkgdir/usr/bin/qmagneto"
  
  #icon and desktop file
  install -d "$pkgdir/usr/share"
  install -d "$pkgdir/usr/share/pixmaps"
  install -d "$pkgdir/usr/share/applications"
  install -m 755 "resources/images/logo_qmagneto.xpm" "$pkgdir/usr/share/pixmaps/logo_qmagneto.xpm"
  install -m 755 "debian/qmagneto.desktop" "$pkgdir/usr/share/applications/qmagneto.desktop"

}

