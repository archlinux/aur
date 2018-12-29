# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo-git
conflicts=('blackchocobo')
pkgver=v1.9.91.r0.gc1942a4
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('any')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base' 'openssl') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=('git://github.com/sithlord48/blackchocobo.git')
md5sums=(SKIP)

pkgver() {
  cd "blackchocobo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "blackchocobo"
  qmake-qt5 Black_Chocobo.pro #Qt5 Build
  make
}
package(){
  cd "blackchocobo"
  INSTALL_ROOT=$pkgdir make install 
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/blackchocobo
  install -D -m644 debian/blackchocobo.sharedmimeinfo "$pkgdir"/usr/share/mime/blackchocobo.xml
}  
