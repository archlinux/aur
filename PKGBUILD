# Maintainer: aksr <aksr at t-com dot me>
pkgname=dformat-git
pkgver=r4.f34a4ae
pkgrel=1
pkgdesc="Jon Bentley's DFORMAT troff preprocessor, reconstituted."
arch=(i686 x86_64)
url="https://github.com/arnoldrobbins/dformat"
license=(unknown)
makedepends=(git)
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=(SKIP)

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
	install -D -m755 dformat.awk $pkgdir/usr/bin/dformat
	install -D -m755 trivial.sh $pkgdir/usr/bin/trivial
	install -D -m644 dformat.pdf $pkgdir/usr/share/doc/${pkgname%-*}/dformat.pdf
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
