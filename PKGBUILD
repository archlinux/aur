# Maintainer: aksr <aksr at t-com dot me>
pkgname=qed-git
pkgver=r29.69fe7a6
pkgrel=1
epoch=1
pkgdesc="A new, improved, port of the Qed editor for Unix, with UTF-8 processing"
arch=('i686' 'x86_64')
url="https://github.com/phonologus/qed-new"
license=('unknown')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url"
        "git+https://github.com/phonologus/QED")
md5sums=('SKIP' 'SKIP')

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
	make LOCALD="$pkgdir/usr" LIBDIR="$pkgdir/usr/lib/qed" MANDIR="$pkgdir/usr/share/man/man1" install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	cd "$srcdir/QED"
	cp --no-preserve=mode -r doc/historical $pkgdir/usr/share/doc/${pkgname%-*}
	install -D -m644 doc/qed-tutorial.pdf $pkgdir/usr/share/doc/${pkgname%-*}/qed-tutorial.pdf
}
