# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kdesudo-frameworks-bzr
pkgver=70
pkgrel=1
pkgdesc="A SUdo frontend for KDE. KF5 Frameworks branch. (BZR version)"
arch=('i686' 'x86_64')
url='https://launchpad.net/kdesudo'
license=('GPL')
depends=('kdelibs4support'
         'sudo'
         )
makedepends=('extra-cmake-modules'
             'kdesignerplugin'
             'kdoctools'
             'bzr'
             'python'
             )
conflicts=('kdesudo')
source=('kdesudo::bzr+lp:~kubuntu-kdesudo/kdesudo/frameworks')
sha1sums=('SKIP')

pkgver() {
  cd kdesudo
  echo "$(bzr revno)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesudo \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
