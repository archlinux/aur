# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=yefm
pkgver=0.2
pkgrel=2
pkgdesc="Simple 2 panes file manager"
url="https://github.com/yede/yefm.git"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.zip::https://github.com/yede/$pkgname/archive/master.zip" make_it_build.patch)
sha256sums=('2b83475c82932c94de2c6d47f111cd0642564d1f5e3a7d316ff96560329873ad'
            'f6e71d701bb7732c2460a0c2db0e1afb54704fae3a8fdb3d9556e4f674513653')

prepare() {
  cd $pkgname-master
  patch -Np1 < "$srcdir"/make_it_build.patch
}

build() {
  cd $pkgname-master
  qmake-qt5 $pkgname.pro
  make 
}
package() {
  cd $pkgname-master
  make INSTALL_ROOT="${pkgdir}" install
}

