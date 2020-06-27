# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-extras-git
pkgver=r6788.7763a1e0
pkgrel=1
pkgdesc="Additional components to increase the functionality of KIO"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kio-extras'
license=('LGPL')
depends=('kdelibs4support-git' 'khtml-git' 'kdnssd-git' 'kpty-git' 'libssh' 'smbclient' 'exiv2' 'openexr' 'libmtp')
makedepends=('extra-cmake-modules-git' 'git' 'openslp' 'kdoctools-git')
conflicts=('kio-extras')
provides=('kio-extras')
install=$pkgname.install
source=('git+https://github.com/KDE/kio-extras.git')
md5sums=('SKIP')

pkgver() {
  cd kio-extras
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kio-extras/ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
