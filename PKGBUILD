# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
#
# This package does not contain any patches. Its main purpose
# is to simplify testing against the latest upstream version.
#
# Unless you have a reason to use the snapshot version,
# you should probably just stick with the aur/lcov package.
#
pkgname=lcov-git
pkgver=r406.43534e8
pkgrel=1
pkgdesc="Latest snapshot of lcov, a front-end for GCC's coverage testing tool gcov"
arch=('any')
url="https://github.com/linux-test-project/lcov"
license=('GPL')
depends=(
  'perl'
  'perl-capture-tiny'
  'perl-datetime'
  'perl-json-xs'
)
makedepends=('git')
conflicts=('lcov')
provides=('lcov')
source=('git+https://github.com/linux-test-project/lcov.git')
md5sums=('SKIP')

pkgver() {
  cd lcov
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/lcov"
  make PREFIX="$pkgdir" install

  # fix namcap warnings about non-standard directories
  mkdir -p "$pkgdir/usr"
  test -d "$pkgdir/usr/bin"   || mv "$pkgdir/bin"   "$pkgdir/usr/bin"
  test -d "$pkgdir/usr/share" || mv "$pkgdir/share" "$pkgdir/usr/share"
  test -d "$pkgdir/usr/lib"   || mv "$pkgdir/lib"   "$pkgdir/usr/lib"
}
