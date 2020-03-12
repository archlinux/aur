pkgname=attica-git
pkgver=v5.68.0.rc1.r0.g5a49f34
pkgrel=1
pkgdesc='Qt5 library that implements the Open Collaboration Services API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/attica'
license=('LGPL')
depends=('qt5-base')
makedepends=('cmake' 'git' 'extra-cmake-modules-git')
conflicts=('attica')
provides=('attica')
source=('attica::git+git://anongit.kde.org/attica')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/attica"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/attica" -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}




