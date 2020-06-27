# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kxmlrpcclient
pkgname=$_pkgname-git
pkgver=r400.1005c7036
pkgrel=1
pkgdesc="XML-RPC client library for KDE"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/kde/pim/$_pkgname"
license=('LGPL')
depends=('kio')
makedepends=(extra-cmake-modules doxygen git qt5-tools qt5-doc)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+https://github.com/KDE/kxmlrpcclient.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$_pkgname
  mkdir -p build
}

build() {
  cd $srcdir/$_pkgname/build
  cmake ../ \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}
