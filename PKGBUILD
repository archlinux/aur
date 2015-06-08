# Contributor: Flamelab <panosfilip@gmail.com> 
# PKGBUILD based on libkface-svn. Contributors:
# Chris Heien <chris.h.heien@gmail.com>
# Dany Martineau <dany.luc.martineau at gmail.com>
pkgname=libkface-git
pkgver=r680.3c9bcbf
pkgrel=1
pkgdesc='A Qt/C++ wrapper around LibFace library to perform face recognition and detection over pictures'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs' 'opencv')
#depends=('opencv' 'ki18n')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libkface')
provides=('libkface')
groups=('digikam-git')
source=('libkface::git+git://anongit.kde.org/libkface')
md5sums=('SKIP')
#source=('libkface::git+git://anongit.kde.org/libkface#branch=frameworks')

pkgver() {
  cd ${srcdir}/libkface
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
  cmake  ${srcdir}/libkface -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}