# Maintainer: 2ion <dev@2ion.de>
# NOTE: Installs from a zipball since the git repository is very large
# and takes a fortnight to download
pkgname=miller-git
pkgver=3.4.0
pkgrel=2
epoch=2
pkgdesc="Miller is like sed, awk, cut, join, and sort for name-indexed data such as CSV"
arch=('x86_64' 'i686')
url="https://github.com/johnkerl/miller"
license=('MIT')
depends=('glibc')
makedepends=('make' 'gcc' 'flex' 'ctags' 'valgrind' 'autoconf' 'automake')
provides=('miller')
conflicts=('miller-git')
source=(https://github.com/johnkerl/miller/archive/master.zip)
md5sums=('SKIP')

pkgver() {
  printf "%s+%s" "$pkgver" "$(date +%Y%m%d)"
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
