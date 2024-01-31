# Maintainer: Anthony Wang <a aat exozy dotme>

_pkgname=sdc
pkgname="$_pkgname-git"
pkgver=r30.a5bfafa
pkgrel=2
pkgdesc="C port of SD, a very efficient flash cards app"
arch=(any)
url="https://git.exozy.me/a/$_pkgname"
license=('GPL')
depends=('sqlite3')
optdepends=('python-pyqt6: PyQT6 GUI'
            'tk: Tkinter GUI')
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
	cd "$srcdir/$_pkgname"
	install -Dm755 sd "$pkgdir/usr/bin/sd"
	install -Dm755 main.py "$pkgdir/usr/bin/sd-qt"
	install -Dm755 tkinter.py "$pkgdir/usr/bin/sd-tk"
	install -Dm644 sd-add.fish "$pkgdir/usr/share/fish/vendor_functions.d/sd-add.fish"
	install -Dm644 sqlitevi.fish "$pkgdir/usr/share/fish/vendor_functions.d/sqlitevi.fish"
}
