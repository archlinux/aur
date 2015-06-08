# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=onioncat-svn
pkgver=561
pkgrel=3
pkgdesc="An IP-Transparent Tor Hidden Service Connector"
arch=('i686' 'x86_64')
url="http://www.cypherpunk.at/onioncat/"
license=('GPL3')
depends=('tor')
makedepends=("subversion")
conflicts=('onioncat')
provides=('onioncat')
install=onioncat.install
source=(onioncat.install)
md5sums=( '7ccaf9425ef6adeb962f27a9fafa6256' )

_svntrunk=https://www.cypherpunk.at/svn/onioncat/trunk
_svnmod=onioncat

source+=("$_svnmod::svn+$_svntrunk")
md5sums+=("SKIP")

pkgver() {
  cd "$srcdir"/$_svnmod
  svnversion | tr -d [A-z]
}

build() {
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

   ./configure --prefix=/usr
   make
}

package() {
  cd "$srcdir/$_svnmod-build"
   make DESTDIR="$pkgdir/" install
}
