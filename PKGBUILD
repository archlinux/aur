# Maintainer: aksr <aksr at t-com dot me>
pkgname=qed-git
pkgver=r136.46e0d70
pkgrel=1
pkgdesc="A port of Rob Pike's version of the QED editor for Unix, supporting UTF8-encoded Unicode."
arch=('i686' 'x86_64')
url="https://github.com/phonologus/QED"
license=('unknown')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

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
	make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man/man1" install
	install -D -m644 doc/qed-tutorial.pdf $pkgdir/usr/share/doc/${pkgname%-*}/qed-tutorial.pdf
	install -D -m644 doc/read.me $pkgdir/usr/share/doc/${pkgname%-*}/read.me
	cp --no-preserve=mode -r q $pkgdir/usr/share/doc/${pkgname%-*}
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

