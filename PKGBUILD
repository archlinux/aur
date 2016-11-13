# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atcore-git
confilicts=('atcore')
pkgver=fb7d440
pkgrel=1
pkgdesc="KDE 3D Printing libary"
arch=('i686' 'x86_64')
url="https://www.kde.org/"
license=('LGPL3')
buildDepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-serialport' 'solid') #Qt5)
source=('git://anongit.kde.org/atcore.git')
md5sums=(SKIP)

pkgver() {
  cd "atcore"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "atcore"
  cmake -DCMAKE_INSTALL_PREFIX=$(qtpaths --install-prefix) -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release -DBUILD_TEST_GUI=ON CMakeLists.txt 
  make
}
package(){
  cd "atcore"
  make DESTDIR="$pkgdir/" install 
}  
