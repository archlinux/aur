pkgname=libkfbapi-git
pkgver=r208.ecb9975
pkgrel=1
pkgdesc='A library for accessing Facebook services.'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('ki18n' 'kio' 'kcoreaddons' 'libaccounts-qt5' 'signon-qt5' 'kaccounts-integration-git')
makedepends=('cmake' 'git' 'automoc4' 'boost')
conflicts=('libkfbapi')
# provides=('libkfbapi')
source=('libkfbapi::git+git://anongit.kde.org/libkfbapi#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/libkfbapi
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d ${srcdir}/build ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf ${srcdir}/build
  fi
  mkdir ${srcdir}/build
}

build() {
  cd ${srcdir}/build
  cmake  ${srcdir}/libkfbapi \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DBUILD_TESTING=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
