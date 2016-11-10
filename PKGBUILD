# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atcore-git
confilicts=('atcore')
pkgver=b8850b3
pkgrel=1
pkgdesc="KDE 3D Printing"
arch=('i686' 'x86_64')
url="https://github.com/KDE/atcore"
license=('LGPL3')
buildDepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-serialport' 'solid') #Qt5)
#install=$pkgname.install
source=("git://github.com/kde/atcore.git")
md5sums=(SKIP)

pkgver() {
  cd "atcore"
  git log --pretty=format:'%h' -n 1
}

build() {
  cd "atcore"
  cmake -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release CMakeLists.txt 
  make
}
package(){
  cd "atcore"
  make DESTDIR="$pkgdir/" install 
  #add the optional stuff for AtCoreTest deployment
  install -D -s -m755 testclient/AtCoreTest $pkgdir/usr/bin/AtCoreTest
  install -D -m644 testclient/AtCoreTest.menu $pkgdir/usr/share/menu/AtCoreTest
  install -D -m644 testclient/AtCoreTest.png $pkgdir/usr/share/pixmaps/AtCoreTest.png
  install -D -m644 testclient/AtCoreTest.desktop $pkgdir/usr/share/applications/AtCoreTest.desktop
}  
