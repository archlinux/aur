# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kdegraphics-thumbnailers-frameworks-git
pkgver=v15.08.2.3.gfa9e70c
pkgrel=1
pkgdesc="Thumbnailers for various graphics file formats. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdegraphics/kdegraphics-thumbnailers'
license=('GPL' 'LGPL' 'FDL')
depends=('kio')
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'libkdcraw-git'
             'libkexiv2-git'
             )
optdepends=('libkdcraw-git: RAW thumb plugin'
            'libkexiv2-git: EXIV2 thumb plugin')
conflicts=('kdegraphics-thumbnailers')
provides=('kdegraphics-thumbnailers')
source=('git://anongit.kde.org/kdegraphics-thumbnailers#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd kdegraphics-thumbnailers
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdegraphics-thumbnailers \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}