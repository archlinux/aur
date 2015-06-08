# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-extras-git
pkgver=r5821.11665af
pkgrel=1
pkgdesc="Additional components to increase the functionality of KIO"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kio-extras'
license=('LGPL')
depends=('kdelibs4support-git' 'khtml-git' 'kdnssd-git' 'kpty-git' 'libssh' 'smbclient' 'exiv2' 'openexr' 'libmtp')
makedepends=('extra-cmake-modules' 'git' 'openslp' 'kdoctools')
conflicts=('kio-extras')
provides=('kio-extras')
install=$pkgname.install
source=('git://anongit.kde.org/kio-extras.git')
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
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
