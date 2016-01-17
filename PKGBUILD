# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=hyne-git
confilicts=('hyne')
pkgver=1.9.0
pkgrel=1
pkgdesc="Final Fantasy 8 Save Editor"
arch=('i686' 'x86_64')
url=("http://github.com/myst6re/hyne")
license=('GPL3')
depends=('qt5-base' 'zlib') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("git://github.com/sithlord48/hyne.git")
md5sums=(SKIP)

pkgver() {
  cd "hyne"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hyne"
  qmake-qt5 Hyne.pro #Qt5 Build
  make
}
package(){
  cd "hyne"
  INSTALL_ROOT=$pkgdir make install 
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/hyne
}  
