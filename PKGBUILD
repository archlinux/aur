# Maintainer: aksr <aksr at t-com dot me>
pkgname=sciteco-git
pkgver=r897.fe62b24
pkgrel=1
pkgdesc='Advanced TECO dialect and interactive screen editor based on Scintilla'
arch=('i686' 'x86_64')
url='https://github.com/rhaberkorn/sciteco'
license=('GPL3')
makedepends=('git' 'groff')
depends=('ncurses' 'glibc' 'gtk3')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init
	autoreconf -iv
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
