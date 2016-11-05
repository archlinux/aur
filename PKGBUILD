# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdialog-git
pkgver=1.0.1036.60c9569
pkgrel=1
pkgdesc="KDialog can be used to show nice dialog boxes from shell scripts. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/kdialog'
license=('LGPL')
depends=('kdelibs4support')
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
conflicts=('kdebase-kdialog'
           'kdialog'
           )
provides=('kdialog')
source=('git://anongit.kde.org/kdialog')
sha256sums=('SKIP')

pkgver() {
  cd kdialog
  _ver="$(cat src/kdialog.cpp | grep -m1 'i18n( ' | sed 's|i18n|ixxn|g' | cut -d '"' -f2)"
  echo "${_ver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdialog \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}
package() {
  pkgdesc='A utility for displaying dialog boxes from shell scripts. (GIT version)'



  make -C build DESTDIR="${pkgdir}" install
}
