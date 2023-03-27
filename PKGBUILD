# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=hyne-git
conflicts=('hyne')
pkgver=1.11.2.2
pkgrel=1
pkgdesc="Final Fantasy 8 Save Editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://github.com/myst6re/hyne"
license=('GPL3')
depends=('qt5-base' 'zlib') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("git+https://github.com/myst6re/hyne.git#branch=develop")
#source=("git://github.com/myst6re/hyne.git#branch=develop")
md5sums=(SKIP)

pkgver() {
  cd "hyne"
  git describe --tags --match '[0-9]*' | sed 's/-/./g;s/v//g' | grep -o "^[0-9]*.[0-9]*.[0-9]*.[0-9]*"
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
