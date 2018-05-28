# Maintainer: martin sandsmark <martin.sandsmark@kde.org>

pkgname=mangonel-frameworks-git
pkgver=r179.067005a
pkgrel=1
pkgdesc='Simple and fast and pretty launcher'
arch=('i686' 'x86_64')
url='https://cgit.kde.org/mangonel.git/'
license=('GPL')
depends=('kglobalaccel' 'knotifications' 'kcoreaddons' 'kunitconversion' 'ki18n')
makedepends=('extra-cmake-modules' 'git')
conflicts=('mangonel' 'mangonel-frameworks')
provides=('mangonel' 'mangonel-frameworks')
source=("git://anongit.kde.org/mangonel.git#branch=frameworks")
sha256sums=('SKIP')

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
