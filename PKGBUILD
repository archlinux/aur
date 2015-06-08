pkgname=libmediawiki-git
pkgver=r76.c899dba
pkgrel=1
pkgdesc='A KDE C++ interface for MediaWiki based web service as wikipedia.org'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libmediawiki')
provides=('libmediawiki')
groups=('digikam-git')
source=('git://anongit.kde.org/libmediawiki')
md5sums=('SKIP')

pkgver() {
  cd libmediawiki
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
  cd build
  cmake  ../libmediawiki -DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}