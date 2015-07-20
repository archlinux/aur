pkgname=attica-git
pkgver=r524.ac29bca
pkgrel=1
pkgdesc='Qt5 library that implements the Open Collaboration Services API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/attica'
license=('LGPL')
depends=('qt5-base')
makedepends=('cmake' 'git' 'extra-cmake-modules-git')
conflicts=('attica-qt5')
provides=('attica-qt5')
source=('attica::git+git://anongit.kde.org/attica')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/attica"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake " ${srcdir}/attica" -DCMAKE_BUILD_TYPE=Release \
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




