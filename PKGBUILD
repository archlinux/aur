# -*- sh -*-
# Maintainer: Carsten Burgard <carsten.burgard@gmail.com>
pkgname=boost-numeric-bindings-svn
pkgrel=1
pkgver=r86799
pkgdesc="Boost Bindings is a bindings library (not just) for Boost.Ublas. It offers an easy way of calling BLAS, LAPACK, UMFPACK, MUMPS and many other mature legacy numerical codes from within C++."
arch=("any")
url="http://mathema.tician.de/software/boost-numeric-bindings/"
license=('Boost Software License 1.0')
groups=()
depends=('boost')
makedepends=('subversion')
provides=()
conflicts=('boost-numeric-bindings-git')
replaces=()
backup=()
options=()

_svnname=numeric_bindings
_svntrunk=http://svn.boost.org/svn/boost/sandbox/$_svnname

source=($_svnname'::svn+'$_svntrunk)
md5sums=('SKIP')

pkgver() {
  cd "$_svnname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
    cd "$srcdir/$_svnname"
}

package() {
    cd "$srcdir/$_svnname"
    tgt_dir=$pkgdir/usr/include
    for header in $(find boost -name '*.hpp' -o -name '*.h'); do
        mkdir -p $(dirname $tgt_dir/$header)
        cp $header $tgt_dir/$header
    done
}

# vim:set ts=2 sw=2 et:
