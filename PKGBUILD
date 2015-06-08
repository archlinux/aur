pkgname=libkipi-git
pkgver=r972.262bbed
pkgrel=1
pkgdesc='An interface to use kipi-plugins from a KDE application'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libkipi')
provides=('libkipi')
groups=('digikam-git')
source=('libkipi::git+git://anongit.kde.org/libkipi')
md5sums=('SKIP')
#source=('libkipi::git+git://anongit.kde.org/libkipi#branch=frameworks')

pkgver() {
  cd ${srcdir}/libkipi
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
  cmake  ${srcdir}/libkipi -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

