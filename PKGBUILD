# Maintainer: aksr <aksr at t-com dot me>
pkgname=demolito-git
pkgver=r639.d3691f9
pkgrel=1
pkgdesc="A UCI chess engine written in C."
arch=('i686' 'x86_64')
url="https://github.com/lucasart/Demolito"
license=('GPL3')
makedepends=(git clang)
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname/src"
	make CC=clang
}

package() {
	cd "$srcdir/$pkgname/src"
	install -D -m755 demolito $pkgdir/usr/bin/demolito
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 license $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
