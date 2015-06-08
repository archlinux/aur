pkgname=libksane-git
pkgver=r345.a37669b
pkgrel=1
pkgdesc='An image scanning library'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs' 'sane')
#depends=('ki18n' 'sane' 'kwallet' 'ktextwidgets' 'kwidgetsaddons')
makedepends=('git' 'automoc4' 'cmake')
conflicts=('libksane')
provides=('libksane')
groups=('digikam-git')
source=('libksane::git+git://anongit.kde.org/libksane')
md5sums=('SKIP')
#source=('libksane::git+git://anongit.kde.org/libksane#branch=frameworks')

pkgver() {
  cd ${srcdir}/libksane
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
  cmake  ${srcdir}/libksane -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}