# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Contributor: Jens Staal <staal1978@gmail.com>

# Adopted from kimap-git
# Antonio Rojas <arojas@archlinux.org>


pkgname=kimap2-git
pkgver=r817.c4d0117
pkgrel=2
pkgdesc="A job-based API for interacting with IMAP servers"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/pim/kimap2"
license=('LGPL')
depends=('kmime')
makedepends=('extra-cmake-modules' 'git' 'python')
conflicts=('kimap2')
provides=('kimap2')
source=('git+https://github.com/KDE/kimap2.git')
md5sums=('SKIP')

pkgver() {
  cd kimap2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kimap2 \
    -DENABLE_TESTING=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
} 
