# Maintainer: Tajidin Abd <tajidinabd at archlinux dot us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=konsole-git
pkgver=r5645.4cbb5ad
pkgrel=1
pkgdesc="KDE's terminal emulator"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/konsole'
license=('GPL' 'LGPL' 'FDL')
depends=('knotifyconfig-git' 'kpty-git' 'kparts-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
provides=('konsole')
conflicts=('konsole' 'kdebase-konsole')
source=('git://anongit.kde.org/konsole.git')
md5sums=('SKIP')

pkgver() {
  cd konsole
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../konsole \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
