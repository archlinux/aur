
pkgname=kwebkitpart-framweworks-git
pkgver=r994.628e1da
pkgrel=1
pkgdesc="A WebKit browser component for KDE 5"
url="https://projects.kde.org/projects/extragear/base/kwebkitpart/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('kdewebkit')
makedepends=('git' 'cmake')
source=("git://anongit.kde.org/kwebkitpart.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd kwebkitpart
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../kwebkitpart \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}




package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
