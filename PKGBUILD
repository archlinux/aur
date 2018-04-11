# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jimmy Bergstrom <thekwarf@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >

pkgname=kwooty-frameworks-git
pkgver=1.1.0.r1228.4def039
pkgrel=1
pkgdesc="A friendly nzb usenet binary downloader for KDE. KF5 frameworks branch. (GIT Version)"
arch=('x86_64')
url='http://kwooty.sourceforge.net'
license=('GPL')
depends=('kdelibs4support'
         'kcmutils'
         'kdesignerplugin'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'cmake'
             'extra-cmake-modules'
             'kdoctools'
             )
optdepends=('unrar: automatic RAR-archive extraction'
            'p7zip: automatic zip and 7z archive extraction'
            'par2cmdline: automatic file repairing'
            )
conflicts=('kwooty')
provides=('kwooty')
source=('git://anongit.kde.org/kwooty#branch=frameworks')
sha256sums=('SKIP')

pkgver() {
  cd kwooty
  _ver=$(cat src/main.cpp | grep 'ki18n("Kwooty"),' | cut -d '"' -f4)
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwooty \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
