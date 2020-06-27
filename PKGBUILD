# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=kdav-git
pkgver=r1228.3f8958e
pkgrel=1
pkgdesc='A DAV protocol implementation with KJobs '
arch=('i686' 'x86_64')
url='https://cgit.kde.org/kdav.git/'
license=('GPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules' 'git')
conflicts=(kdav)
provides=(kdav)
source=('git+https://github.com/KDE/kdav.git')
sha256sums=('SKIP')

pkgver() {
  cd kdav
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mkdir -p build
}

build() { 
  cd "${srcdir}/build"
  cmake "${srcdir}/kdav" \
    -DENABLE_TESTING=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}

