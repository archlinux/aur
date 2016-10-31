
pkgname=kdegraphics-mobipocket-frameworks-git
pkgver=r210.daa7341
pkgrel=1
pkgdesc="A collection of plugins to handle mobipocket files"
url="https://www.kde.org/applications/graphics/"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kio')
makedepends=('cmake')
source=("git://anongit.kde.org/kdegraphics-mobipocket.git#branch=frameworks")
sha1sums=('SKIP')

pkgver() {
  cd kdegraphics-mobipocket
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdegraphics-mobipocket \
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
