# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kio-git
pkgver=v4.100.0.rc1.r3340.gcea57a5b
pkgrel=1
pkgdesc='Resource and network access abstraction'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kio'
license=('LGPL')
depends=('kbookmarks-git' 'kjobwidgets-git' 'kwallet-git' 'solid-git' 'libxslt' 'desktop-file-utils')
makedepends=('extra-cmake-modules-git' 'git' 'kdoctools-git' 'python')
groups=('kf5')
conflicts=(kio)
provides=(kio)
source=('git+https://github.com/KDE/kio.git')
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
  cmake ../kio \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
