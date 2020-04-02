# Maintainer: aksr <aksr at t-com dot me>
pkgname=scrollback-git
pkgver=r100.2a98acd
pkgrel=1
pkgdesc="A scrollback buffer for a terminals like st(1)."
arch=('i686' 'x86_64')
url="https://github.com/muccc/scrollback"
license=(MIT)
makedepends=(git)
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
	mkdir -p $pkgdir/usr/{bin,share/man/man1}
	make PREFIX="$pkgdir/usr" install
	sed '2,17!d' scroll.c > LICENSE
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
