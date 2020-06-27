# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeclarative-git
pkgver=v5.71.0.rc1.r2.g087286f
pkgrel=1
pkgdesc='KDeclarative'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kdeclarative'
license=('LGPL')
depends=('kpackage-git' 'kio-git' 'libepoxy')
makedepends=('extra-cmake-modules-git' 'git' 'python')
conflicts=('kdeclarative')
provides=('kdeclarative')
source=('git+https://github.com/KDE/kdeclarative.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdeclarative \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
