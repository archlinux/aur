# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=course
pkgver=2.r0.geb4ff8e
pkgrel=1
pkgdesc="Course management tools for students."
arch=('any')
url="http://samuellando.com"
license=('GPL')
makedepends=('git')
optdepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+https://github.com/samuellando/course.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  rm ${srcdir}/$pkgname/README.md
  mkdir -p ${pkgdir}/usr/local/man/man1
  cp ${srcdir}/$pkgname/man/* ${pkgdir}/usr/local/man/man1/
  rm -r ${srcdir}/$pkgname/man
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname/* ${pkgdir}/usr/bin/
}
