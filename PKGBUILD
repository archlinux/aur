# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.29
pkgrel=3
pkgdesc='Hybrid Editor XE, for working on both main-frame (SPF editor) and PC.'
arch=('i686' 'x86_64')
url='https://github.com/sakachin2/XE'
license=('GPL')
depends=('libgnomeui')
source=("https://raw.githubusercontent.com/sakachin2/XE/master/${pkgname}-${pkgver}.tar.gz")
md5sums=('3cfef98e8738f71c44328fdc77aa126f')
sha1sums=('4a3db4abaa50debfda611b202d579cd408a8c58d')
sha256sums=('40c10511189d85a0ba2808aa981a11e4f9db0fd41d9215934d45dff690ad171e')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i '6127s@ncursesw/@@' configure
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	mkdir -p $pkgdir/usr/share/doc/gxe/{en,ja}
	install -Dm644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
	install -Dm644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}
