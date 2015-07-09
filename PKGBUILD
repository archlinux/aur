pkgname=htmlcxx
pkgver=0.85
pkgrel=4
pkgdesc="A simple non-validating CSS1 and HTML parser for C++."
arch=('i686' 'x86_64')
url="http://htmlcxx.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=()
conflicts=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
provides=('htmlcxx' 'libhtmlcxx' 'libcss_parser')
source=("http://sourceforge.net/projects/htmlcxx/files/htmlcxx/$pkgver/htmlcxx-$pkgver.tar.gz/download"
        "missing-header.patch")
sha256sums=('ab02a0c4addc82f82d564f7d163fe0cc726179d9045381c288f5b8295996bae5'
            '2df7ea556410979f4ede3cb70d2067ba83eaadd437e3f68d67d0834cc8e4d33c')

build() {
	cd "$srcdir/htmlcxx-$pkgver"
	
	# Thanks to jgehring for the patch.
	patch -p1 -i "$srcdir/missing-header.patch"
	
	LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/htmlcxx-$pkgver"
	make DESTDIR="$pkgdir" install
}
