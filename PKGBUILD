# Maintainer: aksr <aksr at t-com dot me>
pkgname=ff-git
pkgver=0.6.r5.ge3b7901
pkgrel=1
pkgdesc="Fuzzy-completion for finding files."
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/ff"
license=('BSD')
makedepends=('git')
optdepends=('emacs: Emacs wrapper for fuzzy-find.')
source=("$pkgname::git+https://github.com/silentbicycle/ff")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//;s/.flag.features//'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 ff "$pkgdir/usr/bin/ff"
	install -Dm644 ff.1 "$pkgdir/usr/share/man/man1/ff.1"
	install -Dm644 fuzzy-find.el "$pkgdir/usr/share/emacs/site-lisp/fuzzy-find.el"
}
