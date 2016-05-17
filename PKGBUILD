# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kolourpaint-frameworks-git
pkgver=r2016.3a48dd1
pkgrel=1
pkgdesc="Paint Program. KF5 Frameworks branch. (GIT version)"
url='http://kde.org/applications/graphics/kolourpaint'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kdelibs4support'
         'qimageblitz-svn'
         'libksane'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'kdesignerplugin'
             )
conflicts=('kdegraphics-kolourpaint'
           'kolourpaint'
           )
provides=('kolourpaint')
source=('git://anongit.kde.org/kolourpaint#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd kolourpaint
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  sed 's|<KSane>|<KSaneWidget>|g' -i kolourpaint/scan/sanedialog.h
}

build() {
  cd build
  cmake ../kolourpaint \
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
