# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kwrited
pkgname=$_pkgname-git
pkgver=r426.a0aac9f
pkgrel=1
pkgdesc='KDE daemon listening for wall and write messages'
arch=(i686 x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(kpty knotifications kdbusaddons)
makedepends=(extra-cmake-modules git kdoctools)
groups=(plasma)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+https://github.com/KDE/kwrited.git')
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
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
