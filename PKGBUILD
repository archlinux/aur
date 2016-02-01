# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.9.83
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64')
url="http://www.blackchocobo.com/"
license=('GPL3')
#depends=('qt4' 'openssl') #Qt4
depends=('qt5-base' 'openssl') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/blackchocobo/1.9/$pkgver/blackchocobo-$pkgver-src.tar.gz")
md5sums=('5fc50223ba56cd78433c097cef391999')
build() {
  cd "$srcdir/$pkgname-$pkgver-src/"
  #qmake-qt4 Black_Chocobo.pro #Qt4 Build
  qmake-qt5 Black_Chocobo.pro #Qt5 Build
  make
}
package(){
  cd "$srcdir/$pkgname-$pkgver-src/"
  install -D -m755 blackchocobo "$pkgdir"/usr/bin/blackchocobo
  install -D -m644 Black_Chocobo.desktop "$pkgdir"/usr/share/applications/Black_Chocobo.desktop
  install -D -m644 icon/Black_Chocobo.png "$pkgdir"/usr/share/pixmaps/Black_Chocobo.png
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/blackchocobo
  install -D -m644 debian/blackchocobo.sharedmimeinfo "$pkgdir"/usr/share/mime/blackchocobo.xml
  install -d "$pkgdir"/usr/share/blackchocobo/lang/
  cp -r lang/*.qm "$pkgdir"/usr/share/blackchocobo/lang/
}  