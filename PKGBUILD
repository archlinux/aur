# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=kcontacts
pkgname=$_pkgname-git
pkgver=r3175.53a4ef81
pkgrel=1
pkgdesc="Address book API for KDE"
arch=(i686 x86_64)
url="https://community.kde.org/Frameworks"
license=(LGPL)
depends=(kcoreaddons kconfig ki18n kcodecs iso-codes)
makedepends=(extra-cmake-modules git doxygen qt5-tools qt5-doc)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+https://github.com/KDE/kcontacts.git')
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  make
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.LIB "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

}
