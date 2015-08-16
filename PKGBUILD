# Maintainer: 2ion <dev@2ion.de>
# NOTE: Installs from a zipball since the git repository is very large
pkgname=miller-git
pkgver=20150816
pkgrel=2
pkgdesc="Miller is like sed, awk, cut, join, and sort for name-indexed data such as CSV"
arch=('x86_64' 'i686')
url="https://github.com/johnkerl/miller"
license=('MIT')
depends=('glibc')
makedepends=('make' 'gcc' 'flex' 'ctags' 'valgrind')
provides=('miller')
conflicts=('miller-git')
source=(\
  "https://github.com/johnkerl/miller/archive/master.zip"\
  "makefile.patch")
md5sums=(\
  'SKIP'\
  '320be39efd357eb894362ce5f788f88e')

pkgver() {
  date +%Y%m%d
}

prepare() {
  cd "$srcdir/miller-master/c"
  patch Makefile < "$srcdir/makefile.patch"
}

build() {
  cd "$srcdir/miller-master/c"
  PATH="$PWD/dsls:$PATH" make -j1
}

package() {
  cd "$srcdir/miller-master/c"
  install -Dm755 mlr "$pkgdir/usr/bin/mlr"

  cd "$srcdir/miller-master/doc"
  mkdir -p "$pkgdir/usr/share/doc/miller"
  cp -r * "$pkgdir/usr/share/doc/miller"
}
