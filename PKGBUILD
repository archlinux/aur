# Maintainer: aksr <aksr at t-com dot me>
pkgname=newsqueak
pkgver=1
pkgrel=2
pkgdesc='A Unix implementation of Newsqueak.'
arch=('i686' 'x86_64')
url='http://www.herpolhode.com/rob/'
license=('custom:publicdomain')
source=("http://www.herpolhode.com/rob/$pkgname.tar.gz")
md5sums=('3562d4a1a55cc7984c5b1559155c2322')
sha1sums=('085cc8248be5b6145f57b8517e0f22469e5047c1')
sha256sums=('875552bc8fcca2606b3c617a7bc298ecbb2529d42f28a16ced544b66be98d72f')

prepare() {
	cd "$srcdir"
	sed -i 's/CFLAGS	=/& -fcommon/' Makefile
}

build() {
	cd "$srcdir"
	make all
}

check() {
	cd "$srcdir"
	make -k check
}

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/usr/{bin,share/{doc/,licenses/}$pkgname}
	install -D -m 755 $srcdir/squint/squint $pkgdir/usr/bin/squint
	install -D -m 644 $srcdir/doc/language.ps $pkgdir/usr/share/doc/$pkgname/language.ps
	install -D -m 644 $srcdir/doc/implementation.ps $pkgdir/usr/share/doc/$pkgname/implementation.ps
	sed -n '1,8'p README > $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
