# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofsk <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kidentitymanagement
pkgname=$_pkgname-git
pkgver=r3689.0f983efd
pkgrel=1
pkgdesc="KDE PIM libraries"
arch=(i686 x86_64)
url="https://kontact.kde.org"
license=(LGPL)
depends=(kpimtextedit)
makedepends=(extra-cmake-modules git)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+https://github.com/KDE/kidentitymanagement.git')
sha256sums=('SKIP')

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
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
