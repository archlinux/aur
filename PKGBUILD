# Maintainer: Aleix Pol

pkgname=appstreamrunner-git
pkgver=r3.c8e9bbf
pkgrel=1
pkgdesc='Use KRunner to list software'
arch=(i686 x86_64)
license=(LGPL)
depends=(appstream-qt archlinux-appstream-data krunner)
makedepends=(git python)
provides=(appstreamrunner)
source=('git://anongit.kde.org/scratch/apol/appstreamrunner.git')
groups=(plasma)
md5sums=('SKIP')

pkgver() {
  cd appstreamrunner
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../appstreamrunner \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
