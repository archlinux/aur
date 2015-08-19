# Maintainer: Dennis Fink <metalgamer@c3l.lu>
# Contributor: Teteros <teteros @ opmbx dot org>

pkgname=optipng-hg
pkgver=r16.6f7b91f24302
pkgrel=1
pkgdesc="PNG Optimizer which recompresses image files to a smaller size losslessly."
arch=('i686' 'x86_64')
url="http://optipng.sourceforge.net"
license=('ZLIB')
depends=('glibc')
makedepends=('mercurial')
provides=('optipng')
conflicts=('optipng')
source=("$pkgname"::'hg+http://optipng.hg.sourceforge.net:8000/hgroot/optipng/optipng')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname"
  msg2 "Starting configure..."
  ./configure --prefix=/usr --mandir=/usr/share/man
  msg2 "Starting make..."
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m644 "doc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  make DESTDIR="$pkgdir" install
}
