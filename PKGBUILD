# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-nm-git
pkgver=r1678.4d72cb7
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/plasma-nm'
license=('GPL2')
depends=('networkmanager-qt-git' 'modemmanager-qt-git' 'plasma-workspace-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'qt5-tools' 'openconnect')
optdepends=('mobile-broadband-provider-info: Database of mobile broadband service providers' 'openconnect: Cisco AnyConnect VPN') 
provides=('plasma-nm')
conflicts=('plasma-nm')
source=("git://anongit.kde.org/plasma-nm.git")
sha256sums=('SKIP')

pkgver() {
  cd plasma-nm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-nm \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
