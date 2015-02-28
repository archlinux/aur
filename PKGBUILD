# Maintainer: Ondrej Jirman <megous@megous.com>

_pkgname=megatools
pkgname=${_pkgname}-dev-git
pkgver=1.9.94.r78.g796808b
pkgrel=1
pkgdesc="Command line client application for Mega.co.nz (Experimental git dev branch)"
arch=('i686' 'x86_64')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib-networking' 'fuse')
makedepends=('gobject-introspection' 're2c' 'git')
optdepends=('gobject-introspection: Bindings support for JavaScript')
source=("git+https://github.com/megous/megatools#branch=dev")
options=(!libtool)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make install DESTDIR="${pkgdir}"
}
