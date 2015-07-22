# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=tntdb-git
pkgver=1.4rc1.r1.gef30fa1
pkgrel=1
pkgdesc="A C++ library for easy and robust access of SQL databases"
arch=('i686' 'x86_64')
url="http://www.tntnet.org/tntdb.html"
license=('LGPL')
depends=('cxxtools' 'postgresql-libs' 'libmysqlclient' 'sqlite')
makedepends=('git')
provides=('tntdb')
conflicts=('tntdb')
source=("$pkgname::git+https://github.com/maekitalo/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^V//' | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"

  autoreconf -i
  ./configure --enable-silent-rules --prefix=/usr
  make
}

# currently broken
#check() {
#  cd "$pkgname"
#
#  ./test/tntdb-test
#}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
}
