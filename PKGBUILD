# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=fastrpc-git
_gitname=fastrpc
pkgver=python8.0.1
pkgrel=1
pkgdesc="FastRPC library"
url="https://github.com/seznam/fastrpc"
arch=('any')
license=('GPL')
provides=('fastrpc')
depends=('python' 'libxml2')
makedepends=('python-setuptools' 'python-debian')
source=("git://github.com/seznam/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  libtoolize --force
  aclocal
  automake --force-missing --add-missing
  autoconf
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
