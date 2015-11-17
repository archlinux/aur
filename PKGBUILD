# Contributor: Flamelab <panosfilip@gmail.com> 
# PKGBUILD based on libkmap-svn

pkgname=libkgeomap-git
pkgver=r661.d363e11
pkgrel=1
pkgdesc='A wrapper around world map components for browsing and 
arranging photos on a map'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'marble')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libkgeomap')
provides=('libkgeomap')
groups=('digikamsc-git')
source=('libkgeomap::git+git://anongit.kde.org/libkgeomap')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libkgeomap"
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
  cmake "${srcdir}/libkgeomap" -DCMAKE_BUILD_TYPE=Release \
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