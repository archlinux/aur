# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=yefm
pkgver=0.2
pkgrel=1
pkgdesc="Simple 2 panes file manager"
url="https://github.com/yede/yefm.git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.zip::https://github.com/yede/$pkgname/archive/master.zip" make_it_build.patch)
md5sums=('9321399a80c9fb19a984e4781c3ec630'
         '07aa7faaa650ac6500d37fadc079d23b')

prepare() {
  cd $srcdir/$pkgname-master
  patch -Np1 < "$srcdir"/make_it_build.patch
}

build() {
  cd $srcdir/$pkgname-master
  qmake-qt5 $pkgname.pro
  make 
}
package() {
  cd $srcdir/$pkgname-master
  make INSTALL_ROOT="${pkgdir}" install
}

