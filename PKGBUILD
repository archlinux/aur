# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=librepcb-git
_fullname=LibrePCB
pkgver=r675.206955b
pkgrel=1
pkgdesc="LibrePCB is a free EDA software to develop printed circuit boards."
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=('qt5-webkit' 'qt5-tools' 'desktop-file-utils' 'shared-mime-info')
makedepends=('git' 'qconf')
provides=('librepcb')
conflicts=('librepcb')
install=${pkgname}.install
source=('git+https://github.com/LibrePCB/LibrePCB')
md5sums=('SKIP')

build() {
  # Temporary build dir
  rm -rf "$srcdir/$_fullname-build"
  git clone "$srcdir/$_fullname" "$srcdir/$_fullname-build"
  cd "$srcdir/$_fullname-build"

  # Prepare
  cd "$srcdir/$_fullname-build"
  mkdir build && cd build
  qmake -r ../librepcb.pro PREFIX=${pkgdir}/usr

  # Compile
  make
}

package() {
  cd "$srcdir/$_fullname-build/build"
  make install
}

pkgver() {
  cd "$srcdir/$_fullname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
