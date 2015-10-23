# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=krdc-git
pkgver=r1196.088d7b9
pkgrel=1
pkgdesc='Remote Desktop Client'
url='http://kde.org/applications/internet/krdc/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('telepathy-qt5' 'kcmutils' 'kdnssd' 'knotifyconfig' 'libvncserver')
makedepends=('extra-cmake-modules' 'git' 'freerdp' 'kdoctools' 'kdelibs4support')
optdepends=('freerdp: RDP support'
            'keditbookmarks: to edit bookmarks')
provides=(kdenetwork-krdc)
conflicts=(kdenetwork-krdc)
source=('git://anongit.kde.org/krdc.git#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd krdc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../krdc \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
