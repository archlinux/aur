# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=khtml-git
pkgver=r501.cbe1aed
pkgrel=1
pkgdesc='KHtml'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/khtml'
license=('LGPL')
depends=('kparts-git' 'kjs-git' 'giflib')
makedepends=('extra-cmake-modules-git' 'git' 'python')
optdepends=('java-environment')
groups=('kf5-aids')
conflicts=('khtml')
provides=('khtml')
source=('git+https://github.com/KDE/khtml.git')
md5sums=('SKIP')

pkgver() {
  cd khtml
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../khtml \
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
