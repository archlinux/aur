# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=khelpcenter-git
pkgver=r2606.26f94bc9
pkgrel=1
pkgdesc="Application to show KDE Applications' documentation"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/khelpcenter'
license=('LGPL')
depends=('khtml-git' 'kdelibs4support-git' 'kcmutils-git' 'grantlee-qt5' 'xapian-core-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
conflicts=('khelpcenter' 'kdebase-runtime-doc')
provides=('khelpcenter')
source=('git+https://github.com/KDE/khelpcenter.git')
groups=('plasma')
md5sums=('SKIP')

pkgver() {
  cd khelpcenter
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../khelpcenter/ \
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
