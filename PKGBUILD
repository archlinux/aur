# -*- sh -*-
# Maintainer: Carsten Burgard <carsten.burgard@gmail.com>
pkgname=boost-numeric-bindings-git
pkgrel=1
pkgver=0.52.1f994e8
pkgdesc="Boost Bindings is a bindings library (not just) for Boost.Ublas. It offers an easy way of calling BLAS, LAPACK, UMFPACK, MUMPS and many other mature legacy numerical codes from within C++."
arch=("any")
url="http://mathema.tician.de/software/boost-numeric-bindings/"
license=('Boost Software License 1.0')
groups=()
depends=('boost')
makedepends=('git')
provides=()
conflicts=('boost-numeric-bindings-svn')
replaces=()
backup=()
options=()

_branch=HEAD
_gitroot=http://git.tiker.net/trees/boost-numeric-bindings.git
_gitname=boost-numeric-bindings

source=($_gitname'::git+'$_gitroot)
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count $_branch).$(git describe --always)"
}

build() {
    cd "$srcdir/$_gitname"
    python2 configure --prefix=/usr
}

package() {
    cd "$srcdir/$_gitname"
    tgt_dir=$pkgdir/usr/include
    for header in $(find boost -name '*.hpp' -o -name '*.h'); do
        mkdir -p $(dirname $tgt_dir/$header)
        cp $header $tgt_dir/$header
    done
}

# vim:set ts=2 sw=2 et:
