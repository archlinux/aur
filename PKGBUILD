# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=sink-develop-git
pkgver=r2484.0e08b053
pkgrel=1
pkgdesc='An offline-caching, synchronization and indexing system for PIM data (development branch)'
arch=('i686' 'x86_64')
url='https://github.com/KDE/sink'
license=('GPL')
depends=('qt5-base' 'kimap2-git' 'kasync-git' 'kdav2' 'kcontacts' 'flatbuffers')
makedepends=('extra-cmake-modules' 'git' 'clang')
conflicts=(sink)
provides=(sink)
source=("git://anongit.kde.org/sink.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd sink
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mkdir -p build
}

build() { 
  cd "${srcdir}/build"
  cmake "${srcdir}/sink" \
    -DENABLE_TESTING=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make -j1
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}
