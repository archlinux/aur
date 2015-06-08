pkgname=libkgapi-git
pkgver=r598.3304f3c
pkgrel=1
pkgdesc='A KDE-based library for accessing various Google services via 
their public API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkgapi'
license=('GPL' 'LGPL' 'FDL')
depends=('kdepimlibs')
makedepends=('cmake' 'git' 'boost')
conflicts=('libkgapi')
provides=('libkgapi')
source=('libkgapi::git+git://anongit.kde.org/libkgapi')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/libkgapi
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse 
--short HEAD)"
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
  cmake  ${srcdir}/libkgapi -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DKDE4_BUILD_TESTS=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

