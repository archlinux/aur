pkgname=libkgapi-git
pkgver=r687.
pkgrel=1
pkgdesc='A KDE-based library for accessing various Google services via 
their public API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkgapi'
license=('GPL' 'LGPL' 'FDL')
depends=('kcontacts-git' 'kcalcore-git')
makedepends=('extra-cmake-modules' 'git')
conflicts=('libkgapi''libkgapi-frameworks-git')
provides=('libkgapi')
source=('libkgapi::git+git://anongit.kde.org/libkgapi')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/libkgapi"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse 
--short HEAD)"
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
  cmake  "${srcdir}/libkgapi" -DCMAKE_BUILD_TYPE=Release \
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

