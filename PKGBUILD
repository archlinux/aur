# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=syndication
pkgname=kde-$_gitname-git
pkgver=r542.cdc0e3f
pkgrel=1
pkgdesc="RSS/Atom parser library"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/pim/$_gitname"
license=('LGPL')
depends=('kio')
makedepends=('extra-cmake-modules-git' 'git' 'python')
conflicts=("kde-$_gitname")
provides=("kde-$_gitname")
source=("git://anongit.kde.org/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
