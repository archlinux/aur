 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=liquidshell-git
_gitname=liquidshell
pkgver=r527.1748dc4
pkgrel=1
pkgdesc='Alternative desktop replacement for Plasma, using QtWidgets instead of QtQuick to ensure hardware acceleration is not required'
arch=('x86_64')
url='https://invent.kde.org/system/liquidshell'
license=('GPL3')
depends=('networkmanager-qt5' 'bluez-qt5' 'kcmutils5' 'knewstuff5' 'packagekit-qt5' 'hicolor-icon-theme')
makedepends=('cmake' 'extra-cmake-modules' 'git')
optdepends=('ksysguard' 'kconfig5')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${_gitname}
   
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
   cd ${_gitname}

   mkdir build && cd build
   cmake .. \
         -DCMAKE_INSTALL_PREFIX=/usr
   

}

package() {

make -C ${_gitname}/build DESTDIR=${pkgdir} install

}
