# Maintainer: Robert Rüger  mail robertrueger de
#                          <    @            .  >
pkgname=ftl-git
pkgver=r172.d977353
pkgrel=1
pkgdesc="The Fortran Template Library"
arch=('i686' 'x86_64')
url="https://github.com/robertrueger/ftl"
license=('LGPL')
depends=('gcc-fortran' 'pcre')
makedepends=('git')
source=("${pkgname}::git+https://github.com/robertrueger/ftl.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  make BUILD=release
}

check() {
  cd "$srcdir/${pkgname}"
  make BUILD=release test
}

package() {
  cd "$srcdir/${pkgname}"
  make BUILD=release PREFIX="$pkgdir"/usr install
}
