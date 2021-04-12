# Contributor: Flamelab <panosfilip@gmail.com>
pkgname=libkdcraw-git
pkgver=v21.03.90.r0.g91a7df0
pkgrel=1
pkgdesc='A C++ interface used to decode RAW picture'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'libraw')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libkdcraw')
provides=('libkdcraw')
groups=('digikamsc-git')
source=('libkdcraw::git+https://anongit.kde.org/libkdcraw')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libkdcraw"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  cmake "${srcdir}/libkdcraw" -DCMAKE_BUILD_TYPE=Release \
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
