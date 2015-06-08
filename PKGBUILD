# Contributor: Flamelab <panosfilip@gmail.com> 
# PKGBUILD based on libkmap-svn

pkgname=libkgeomap-git
pkgver=r514.c864ef7
pkgrel=1
pkgdesc='A wrapper around world map components for browsing and 
arranging photos on a map'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs' 'kdeedu-marble')
#depends=('kdeedu-marble' 'kconfig' 'ki18n' 'khtml')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libkgeomap')
provides=('libkgeomap')
groups=('digikam-git')
source=('libkgeomap::git+git://anongit.kde.org/libkgeomap')
md5sums=('SKIP')
#source=('libkgeomap::git+git://anongit.kde.org/libkgeomap#branch=frameworks')

pkgver() {
  cd ${srcdir}/libkgeomap
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
  cmake  ${srcdir}/libkgeomap -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
