# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=kolourpaint-git
pkgver=r2290.75f54996
pkgrel=1
pkgdesc="Paint Program. (GIT version)"
url='http://kde.org/applications/graphics/kolourpaint'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kxmlgui'
         'kio'
         'libksane'
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
source=('git://anongit.kde.org/kolourpaint')
sha1sums=('SKIP')

pkgver() {
  cd kolourpaint
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
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
