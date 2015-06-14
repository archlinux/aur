# Maintainer: Thibault Guittet <guittet dot thibault at gmail dot com>
_pkgname=connman-ncurses
pkgname=$_pkgname-git
pkgver=20150614
pkgrel=1
pkgdesc="Simple ncurses UI for ConnMan"
arch=('any')
url="https://github.com/eurogiciel-oss/connman-json-client"
license=('GPL2')
depends=('json-c' 'ncurses' 'connman')
makedepends=('git')
provides=("$_pkgname=$pkgver")
source=("git://github.com/eurogiciel-oss/connman-json-client.git"
		"pull_request_14.patch")
sha256sums=("SKIP"
			"ab14231b763d67eb0767da0600cbe5c9e94bbedfa52d374a12c374706887da41")

_gitroot="connman-json-client"

prepare() {
  cd "$srcdir/$_gitroot"
  patch -p1 -i $srcdir/pull_request_14.patch
}

build() {
  cd "$srcdir/$_gitroot"
  ./run-me.sh
}

package() {
  install -Dm733 "$srcdir/$_gitroot/connman_ncurses" "$pkgdir/usr/bin/$_pkgname"
}
