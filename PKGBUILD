# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwallet-git
pkgver=r976.fc36db0
pkgrel=1
pkgdesc='KWallet Framework'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kwallet'
license=(LGPL)
depends=(knotifications-git kiconthemes-git kservice-git gpgme)
makedepends=(extra-cmake-modules-git git python boost kdoctools-git)
conflicts=(kwallet)
provides=(kwallet)
source=('git+https://github.com/KDE/kwallet.git')
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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
