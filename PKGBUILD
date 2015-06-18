# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=tntdb-git
pkgver=1.3.1.3dd171f
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

# This will very likely break if tntdb starts using tags. That is intentional,
# as the --always will be removed then anyway, requiring an update
pkgver() {
  cd "$pkgname"
  echo "1.3.1.$(git describe --always)"
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
