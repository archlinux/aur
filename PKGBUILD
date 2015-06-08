# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=gpgmepp
pkgname=$_gitname-git
pkgver=r1054.47a866d
pkgrel=1
pkgdesc="C++ bindings/wrapper for gpgme"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/kde/pim/$_gitname"
license=(LGPL)
depends=(gpgme qt5-base)
makedepends=(extra-cmake-modules git python boost)
conflicts=("$_gitname")
provides=("$_gitname")
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
