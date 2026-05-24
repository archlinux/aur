# Maintainer: aksr <aksr88 at gmail dot com>
pkgname=emsys-git
pkgver=r206.ad8dd6f
pkgrel=1
pkgdesc='An ersatz-emacs text editor for unix-like systems (and msys, hence the name!) with no dependencies.'
arch=('i686' 'x86_64')
url='https://github.com/japanoise/emsys'
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make \
	     PREFIX=$pkgdir/usr \
	     BINDIR=$pkgdir/usr/bin \
	     MANDIR=$pkgdir/usr/share/man/man1 \
	     DOCDIR=$pkgdir/usr/share/doc/emsys \
	     install
}
