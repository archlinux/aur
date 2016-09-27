
pkgname=kwebkitpart-frameworks-git
pkgver=r995.16ae1e5
pkgrel=2
pkgdesc="A WebKit browser component for KDE5 - for use Webkit under Konqueror"
url="https://quickgit.kde.org/?p=kwebkitpart.git"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('kdewebkit' 'kdelibs4support')
makedepends=('cmake')
source=("git://anongit.kde.org/kwebkitpart.git")
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
