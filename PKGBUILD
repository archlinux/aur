pkgname=libkexiv2-git
pkgver=r641.48a2e4c
pkgrel=1
pkgdesc='A library to manipulate pictures metadata'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs' 'exiv2')
#depends=('ki18n' 'kcoreaddons' 'ktextwidgets')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libkexiv2')
provides=('libkexiv2')
groups=('digikam-git')
source=('libkexiv2::git+git://anongit.kde.org/libkexiv2')
md5sums=('SKIP')
#source=('libkexiv2::git+git://anongit.kde.org/libkexiv2#branch=frameworks')

pkgver() {
  cd ${srcdir}/libkexiv2
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
  cmake  ${srcdir}/libkexiv2 -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
