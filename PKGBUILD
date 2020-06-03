# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=baloo-widgets
pkgname=$_pkgname-git
pkgver=r648.925e353
pkgrel=1
pkgdesc="Widgets for Baloo (Git)"
arch=(i686 x86_64)
url='https://community.kde.org/Baloo'
license=(LGPL)
depends=(baloo)
makedepends=(extra-cmake-modules git kdoctools)
source=("git+https://github.com/KDE/baloo-widgets.git")
provides=(baloo-widgets)
conflicts=(baloo-widgets)
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
