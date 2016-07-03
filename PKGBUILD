# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kproperty-git
pkgver=2.99.0.r514.fa50fe7
pkgrel=1
pkgdesc="A property editing framework with editor widget similar to what is known from Qt Designer. (GIT version)"
url='https://www.kde.org/applications/graphics/kproperty'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kguiaddons'
         'kwidgetsaddons'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
conflicts=('kproperty')
provides=('kproperty')
source=('git://anongit.kde.org/kproperty.git')
sha1sums=('SKIP')


pkgver() {
  cd kproperty
  _ver="$(cat CMakeLists.txt | grep -m1 KPROPERTY_VERSION | cut -d '"' -f2)"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../kproperty \
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
