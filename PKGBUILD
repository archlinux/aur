# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=atelier-git
conflicts=('atelier')
pkgver=0.0.80.r480.d73b93a
pkgrel=1
pkgdesc="KDE 3D Printer Host"
arch=('i686' 'x86_64')
url="https://www.kde.org/"
license=('GPL3')
buildDepends=('git' 'cmake' 'extra-cmake-modules')
depends=('qt5-base' 'qt5-serialport' 'qt5-charts' 'qt5-3d' 'atcore-git' 'kxmlgui' 'ktexteditor' 'qwt' 'qt5-multimedia' 'gst-plugins-good') #Qt5)
source=('git://anongit.kde.org/atelier.git')
md5sums=(SKIP)

pkgver() {
  cd "atelier"
   version="0.0.80"
   printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "atelier"
  cmake -DCMAKE_INSTALL_PREFIX=$(qtpaths --install-prefix) -DCMAKE_BUILD_TYPE=Release CMakeLists.txt 
  make
}
package(){
  cd "atelier"
  make DESTDIR="$pkgdir/" install 
}  
