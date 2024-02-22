pkgname=garli
pkgver=2.1
pkgrel=4
pkgdesc="Phylogenetic analysis of molecular sequence data using the maximum-likelihood criterion"
arch=('x86_64')
url="https://github.com/zwickl/garli"
license=('GPL2')
depends=('gcc-libs' 'ncl')
makedepends=('make' 'autoconf' 'git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/$pkgname/tags/$pkgver-release"
  aclocal -I config
  autoheader
  automake --add-missing
  autoreconf --force --install -v
  ./configure --prefix=/usr -with-ncl=/usr --disable-shared --enable-static
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname/tags/$pkgver-release"
  make DESTDIR="$pkgdir" install
}
