# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=urbit-git
_gitname=urbit
pkgver=71085e0
pkgrel=1
pkgdesc="An Operating Function"
url="http://www.urbit.org"
arch=("i686" "x86_64")
license=( "public_domain" )
depends=( "libsigsegv" "termcap" "openssl" )
source=( $_gitname"::git+https://github.com/urbit/urbit" )
sha1sums=( 'SKIP' )

pkgver() {
    cd $srcdir/$_gitname
    local ver="$(git describe --always)"
    printf "%s" "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"
  make || true # first time it fails
  make
}

package() {
  cd "$srcdir/$_gitname"
  make debinstall DESTDIR="$pkgdir"
}
