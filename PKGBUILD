# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>

_pkgname=guess-style
pkgname=emacs-$_pkgname-git
pkgver=2015.04.21.g3fd1f10
pkgrel=1
pkgdesc="Automatic setting of code style variables"
arch=("any")
url="http://nschum.de/src/emacs/guess-style/"
license=("GPL3")
makedepends=("emacs")
depends=("emacs")
install="$pkgname.install"
source=("git+https://github.com/nschum/$_pkgname.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build () {
	cd "$srcdir/$_pkgname"
	emacs --batch --no-site-file -f batch-byte-compile "$_pkgname.el"
}

package() {
	cd "$srcdir/$_pkgname"
	install -dm755 "$pkgdir/usr/share/emacs/site-lisp/"
	cp *.el{c,} "$pkgdir/usr/share/emacs/site-lisp/"
}
