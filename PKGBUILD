# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.29
pkgrel=4
pkgdesc='Hybrid Editor XE, for working on both main-frame (SPF editor) and PC.'
arch=('i686' 'x86_64')
url='https://github.com/sakachin2/XE'
license=('GPL')
depends=('libgnomeui')
source=("https://github.com/sakachin2/XE/raw/master/$pkgname-$pkgver.tar.gz")
md5sums=('d052e66c77c6e9d5be070b39097f734d')
sha1sums=('c7bde2ab6211e7eb64d188eff520759dfc80ae00')
sha256sums=('42cf14ca1612670542f13950efb08c1c6e6318796345ba682d6c1ebf10520b9b')

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
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}
