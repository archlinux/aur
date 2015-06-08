# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Vladimir Chizhov <master@mirlord.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qgo2-git
pkgver="2.1.0".2015.06.07.397c01d
pkgrel=1
pkgdesc='Go client and full featured SGF editor; svn-snapshot of the next major version'
arch=('i686' 'x86_64')
url='https://github.com/pzorin/qgo'
license=('GPL')
depends=('desktop-file-utils' 'qt5-multimedia')
makedepends=('git')
install=qgo2.install
conflicts=('qgo' 'qgo2-cvs' 'qgo2-svn')
source=("$pkgname"::"git+https://github.com/pzorin/qgo.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" $(awk '/VERSION/ {print $3}' src/defines.h) $(git log -1 --format="%cd.%h" --date=short | sed 's/-/./g')
}

build() {
  cd "$pkgname"
  qmake-qt5 QMAKE_CXXFLAGS="-fpermissive $CXXFLAGS" -o Makefile qgo.pro
  make
}

package() {
  cd "$pkgname"
  QTDIR=/usr make INSTALL_ROOT="$pkgdir/" install
}
