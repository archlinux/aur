# Maintainer: Robert Hawdon <aur at robertianhawdon dot me dot uk>

pkgname=dfshow-git
pkgver=20180801
pkgrel=1
pkgdesc="An interactive directory/file browser written for Unix-like systems."
arch=('i686' 'x86_64' 'arm')
url="https://github.com/roberthawdon/dfshow"
license=('GPL3')
depends=('ncurses')
makedepends=('git' 'autoconf' 'automake')
source=('git+https://github.com/roberthawdon/dfshow')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/dfshow"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/dfshow"
  aclocal
  autoheader
  autoconf
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/dfshow"
  make DESTDIR="${pkgdir}" install
}