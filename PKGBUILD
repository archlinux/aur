pkgname=libkexiv2-git
pkgver=r782.6c196e4
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'exiv2')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libkexiv2')
provides=('libkexiv2')
groups=('digikamsc-git')
source=('libkexiv2::git+git://anongit.kde.org/libkexiv2')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libkexiv2"
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
  cmake "${srcdir}/libkexiv2" -DCMAKE_BUILD_TYPE=Release \
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