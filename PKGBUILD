# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt6-git
_gitname=Kvantum
pkgver=1.0.7.r0.ga5ec3206
pkgrel=1
pkgdesc="Qt6 component of the Kvantum theme engine"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL3')
depends=('kvantum-qt5-git>=1.0.3.r0' 'qt6-svg' 'qt5-x11extras' 'hicolor-icon-theme' 'kwindowsystem')
makedepends=('cmake' 'qt6-tools' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
  # Fix Qt6 build with Qt5 installed
  sed 's|Qt6 Qt5|Qt6|' -i ${srcdir}/${_gitname}/${_gitname}/style/CMakeLists.txt
}

## Thanks ArchangeGabriel

build() {
   cd ${srcdir}/${_gitname}/${_gitname}
   mkdir -p build6 && cd build6
   cmake .. \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DENABLE_QT5=OFF
   make
   
}

package() {
   make -C ${srcdir}/${_gitname}/${_gitname}/build6 DESTDIR=${pkgdir}/ install
    
}
