pkgname=libmediawiki-git
pkgver=r108.a5cd0ea
pkgrel=1
pkgdesc='A KDE C++ interface for MediaWiki based web service as wikipedia.org'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'kcoreaddons')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libmediawiki')
provides=('libmediawiki')
groups=('digikamsc-git')
source=('git://anongit.kde.org/libmediawiki')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libmediawiki"
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
  cmake "${srcdir}/libmediawiki" -DCMAKE_BUILD_TYPE=Release \
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