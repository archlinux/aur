# Contributor: Flamelab <panosfilip@gmail.com>
pkgname=libkdcraw-git
pkgver=r937.baf426f
pkgrel=1
pkgdesc='A C++ interface used to decode RAW picture'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs' 'libraw')
#depends=('libraw' 'kconfig' 'kwidgetsaddons' 'kio')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libkdcraw')
provides=('libkdcraw')
groups=('digikam-git')
source=('libkdcraw::git+git://anongit.kde.org/libkdcraw')
md5sums=('SKIP')
#source=('libkdcraw::git+git://anongit.kde.org/libkdcraw#branch=frameworks')

pkgver() {
  cd ${srcdir}/libkdcraw
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
  cmake  ${srcdir}/libkdcraw -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
