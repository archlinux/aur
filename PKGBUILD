# Maintainer: aksr <aksr at t-com dot me>
pkgname=ugrep-git
pkgver=2.0.2.r1.gc47f5c5
pkgrel=1
pkgdesc="Ultra fast interactive searcher of file systems, text and binary files, source code, archives, compressed files, documents, and more."
arch=('i686' 'x86_64')
url="https://github.com/Genivia/ugrep"
license=(BSD)
depends=(pcre2 zlib bzip2 xz)
makedepends=(git)
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	./build.sh --prefix=${pkgdir}/usr/
}

package() {
	cd "$srcdir/$pkgname"
	make install
	install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
