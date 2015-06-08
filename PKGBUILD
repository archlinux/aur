# Maintainer: Antonio Rojas 

pkgname=muon-git
pkgver=r3607.b929b4d
pkgrel=1
pkgdesc='A collection of package management tools for KDE'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/muon'
license=('LGPL')
depends=('packagekit-qt5' 'knewstuff-git' 'plasma-framework-git' 'appstream-qt' 'archlinux-appstream-data' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'git' 'python')
conflicts=('muon')
provides=('muon')
source=('git://anongit.kde.org/muon.git')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd muon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../muon \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
