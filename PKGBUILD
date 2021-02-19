# Maintainer: aksr <aksr at t-com dot me>
pkgname=qed-git
pkgver=r163.16a095b
pkgrel=1
pkgdesc="UTF-8/Unicode-aware port of Rob Pike's QED editor for Unix"
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
	make INSTALLD="$pkgdir/usr" install
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	cp --no-preserve=mode -r q doc/historical $pkgdir/usr/share/doc/${pkgname%-*}
	install -D -m644 doc/qed-tutorial.pdf $pkgdir/usr/share/doc/${pkgname%-*}/qed-tutorial.pdf
}
