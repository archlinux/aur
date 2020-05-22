# Maintainer: aksr <aksr at t-com dot me>
pkgname=qed-git
pkgver=r132.5a91cab
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
	install -D -m755 qed $pkgdir/usr/bin/qed
	install -D -m644 doc/qed.1 $pkgdir/usr/share/man/man1/qed.1
	install -D -m644 tutorial.pdf $pkgdir/usr/share/doc/${pkgname%-*}/tutorial.pdf
	install -D -m644 doc/read.me $pkgdir/usr/share/doc/${pkgname%-*}/read.me
	cp --no-preserve=mode -r q $pkgdir/usr/share/doc/${pkgname%-*}
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

