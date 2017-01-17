# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=sink-develop
pkgver=r1410.889bda7
pkgrel=1
pkgdesc='Development branch of Akonadi replacement sink'
arch=('i686' 'x86_64')
url='https://github.com/KDE/sink'
license=('GPL')
depends=('qt5-base' 'kimap2-git' 'kasync-git' 'flatbuffers')
makedepends=('extra-cmake-modules' 'git')
conflicts=(sink)
provides=(sink)
source=("git://anongit.kde.org/sink.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd sink
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/sink"
  mkdir -p build
}

build() { 
  cd "${srcdir}/sink/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${srcdir}/sink/build"
  make DESTDIR="$pkgdir" install
}
