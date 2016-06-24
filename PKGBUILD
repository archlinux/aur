# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=baloo-git
pkgver=r2021.db8b416
pkgrel=2
pkgdesc="A framework for searching and managing metadata"
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kdelibs/baloo'
license=(LGPL)
depends=(lmdb kfilemetadata-git kidletime-git kio-git)
makedepends=(extra-cmake-modules-git git kdoctools-git python)
groups=(kf5)
provides=(baloo)
conflicts=(baloo)
install=$pkgname.install
source=('git://anongit.kde.org/baloo.git')
md5sums=('SKIP')

pkgver() {
  cd baloo
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../baloo \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
