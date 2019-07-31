# Maintainer: martin

pkgname=mangonel-frameworks-git
pkgver=r208.7b2c5a2
pkgrel=1
pkgdesc='Simple and fast and pretty launcher'
arch=('i686' 'x86_64')
url='https://phabricator.kde.org/source/mangonel/'
license=('GPL')
depends=('ki18n' 'kglobalaccel' 'knotifications' 'kunitconversion' 'kdbusaddons' 'kservice' 'knotifyconfig')
makedepends=('extra-cmake-modules' 'git')
conflicts=('mangonel-frameworks' 'mangonel')
provides=('mangonel-frameworks' 'mangonel')
source=("git://anongit.kde.org/mangonel.git#branch=frameworks")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd mangonel
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../mangonel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
