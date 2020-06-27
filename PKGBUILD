# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesu-git
pkgver=r400.5b2f4a7
pkgrel=1
pkgdesc='KDE Su'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdesu'
license=('LGPL')
depends=('kservice-git' 'kpty-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kdesu)
provides=(kdesu)
source=('git+https://github.com/KDE/kdesu.git')
md5sums=('SKIP')

pkgver() {
  cd kdesu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesu \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
