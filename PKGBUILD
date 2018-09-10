# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=libxdgmime-git
_pkgname=libxdgmime
pkgver="r113.db79e7c"
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Reference implementation of the shared-mime-info spec"
url="https://github.com/pcercuei/libxdgmime"
license=('LGPL' 'custom:AFLv2')
depends=('shared-mime-info')
makedepends=('git')
provides=('libxdgmime')
source=("$_pkgname::git+https://github.com/pcercuei/libxdgmime/"
	"afl-2.0.txt")
sha256sums=('SKIP'
	'67e76faa7e0ea9460b92194e1c58290e90b08791a102fb95fcdc2282d5170dfe')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  mv "$srcdir/../afl-2.0.txt" "$srcdir"
#}

build() {
  cd "$srcdir/$_pkgname"
  make all
}

package() {
  cd "$srcdir/$_pkgname"
  make install PREFIX=/usr DESTDIR="$pkgdir"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 $srcdir/afl-2.0.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$_pkgname/README "$pkgdir/usr/share/licenses/$pkgname/"
}
