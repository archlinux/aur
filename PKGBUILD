# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kinit-git
pkgver=v4.100.0.rc1.r266.g786ff48
pkgrel=1
pkgdesc='KInit'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kinit'
license=('LGPL')
depends=('kio-git')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
groups=('kf5')
conflicts=('kinit')
provides=('kinit')
source=('git+https://github.com/KDE/kinit.git')
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
  cmake ../kinit \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
