# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-git
pkgver=r623.d14b2da
pkgrel=1
pkgdesc='KWallet Framework'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kwallet'
license=(LGPL)
depends=(knotifications-git gpgmepp-git)
makedepends=(extra-cmake-modules-git git python)
conflicts=(kwallet)
provides=(kwallet)
source=('git://anongit.kde.org/kwallet.git')
md5sums=('SKIP')

pkgver() {
  cd kwallet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kwallet \
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
