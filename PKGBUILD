# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=hyne-git
conflicts=('hyne')
pkgver=1.9.2c.r2.g480170f
pkgrel=1
pkgdesc="Final Fantasy 8 Save Editor"
arch=('i686' 'x86_64')
url="http://github.com/myst6re/hyne"
license=('GPL3')
depends=('qt5-base' 'zlib') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("git://github.com/myst6re/hyne.git#branch=develop")
md5sums=(SKIP)

pkgver() {
  cd "hyne"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
