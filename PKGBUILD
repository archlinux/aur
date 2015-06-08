# Maintainer: Antonio Rojas 

pkgname=rekonq-frameworks-git
pkgver=r3726.c60e5b0
pkgrel=1
pkgdesc='A WebKit based web browser for KDE'
arch=('i686' 'x86_64')
url='http://rekonq.kde.org/'
license=('GPL')
depends=('kcmutils' 'kdewebkit' 'kinit')
makedepends=('extra-cmake-modules' 'git' 'python')
conflicts=('rekonq')
provides=('rekonq')
source=("git://anongit.kde.org/rekonq.git#branch=frameworks")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd rekonq
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../rekonq \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
