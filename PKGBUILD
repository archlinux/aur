# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kcrash-git
pkgver=v5.68.0.rc1.r0.g4035afe
pkgrel=1
pkgdesc='KCrash'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kcrash'
license=('LGPL')
depends=('kcoreaddons-git' 'kwindowsystem-git')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kcrash)
provides=(kcrash)
source=('git://anongit.kde.org/kcrash.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kcrash \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
