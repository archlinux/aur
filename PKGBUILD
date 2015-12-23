# Maintainer: 2ion <dev@2ion.de>
# NOTE: Installs from a zipball since the git repository is very large
# and takes a fortnight to download
pkgname=miller-git
pkgver=20151224
pkgrel=2
pkgdesc="Miller is like sed, awk, cut, join, and sort for name-indexed data such as CSV"
arch=('x86_64' 'i686')
url="https://github.com/johnkerl/miller"
license=('MIT')
depends=('glibc')
makedepends=('make' 'gcc' 'flex' 'ctags' 'valgrind')
provides=('miller')
conflicts=('miller-git')
source=(https://github.com/johnkerl/miller/archive/master.zip)
md5sums=('SKIP')

pkgver() {
  date +%Y%m%d
}

prepare() {
  cd "$srcdir/miller-master"
  autoreconf --force --install
  automake --add-missing
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/miller-master"
  make
}

package() {
  cd "$srcdir/miller-master"
  make DESTDIR="$pkgdir" install
}
