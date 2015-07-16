# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdelibs4support-git
pkgver=r544.9d39a69
pkgrel=1
pkgdesc='KDE 4 Support'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/frameworks/kdelibs4support'
license=(LGPL)
depends=(kunitconversion-git kdesignerplugin-git kemoticons-git kitemmodels-git kinit-git)
makedepends=(extra-cmake-modules-git git kdoctools-git qt5-tools networkmanager perl-uri)
conflicts=(kdelibs4support)
provides=(kdelibs4support)
groups=(kf5-aids)
source=('git://anongit.kde.org/kdelibs4support.git')
md5sums=('SKIP')

pkgver() {
  cd kdelibs4support
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdelibs4support \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
