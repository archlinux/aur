# Maintainer: Anthony Wang <a aat exozy dotme>

_pkgname=sdc
pkgname="$_pkgname-git"
pkgver=r15.cd9b330
pkgrel=1
pkgdesc="C port of SD, a very efficient flash cards app"
arch=(any)
url="https://git.exozy.me/a/$_pkgname"
license=('GPL')
groups=()
depends=('sqlite3')
makedepends=('git' 'gcc')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	gcc $CFLAGS sd.c segmenttree.c -o sd -lsqlite3
}

package() {
	install -Dm755 "$srcdir/$_pkgname/sd" "$pkgdir/usr/bin/sd"
}
