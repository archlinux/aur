# Maintainer Saulius Lukauskas <luksaulius at gmail>

pkgname=libgtextutils
pkgver=0.7
pkgrel=3
arch=(x86_64)
pkgdesc='Gordon’s Text utils Library'
url="https://github.com/agordon/$pkgname"
source=("$url/archive/$pkgver.tar.gz"
        'https://patch-diff.githubusercontent.com/raw/agordon/libgtextutils/pull/6.diff')
makedepends=(libtool)
sha256sums=('9eed751dea812ab247486f040754815bd3d0239557d0f91c0152d1b5b10dbc3e'
            'c2c80eefb3feab6c12fcf29a0543377de557ee44c25e5835272a106eb4ea9f25')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/6.diff"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	./reconf
	./configure --prefix="$pkgdir/usr"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
	sed -i 's|^prefix=.*$|prefix=/usr|' "$pkgdir/usr/lib/pkgconfig/gtextutils.pc"
}
