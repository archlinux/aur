# Maintainer: aksr <aksr at t-com dot me>
pkgname=gxe
pkgver=1.30
pkgrel=1
pkgdesc='Hybrid Editor XE, for working on both main-frame (SPF editor) and PC.'
arch=('i686' 'x86_64')
url='https://github.com/sakachin2/XE'
license=('GPL')
depends=('ncurses') # 'gtk3: to enable gxe' 'libgnomeui: to enable gnomeui')
source=("https://github.com/sakachin2/XE/raw/7359b1e8dca5e657aa7d577da58ada55746f2164/$pkgname-$pkgver.tar.gz")
md5sums=('dbe56f4e6d6ffbff80096518bde1ef1a')
sha1sums=('b538a3622a2f882a6ee1ae33e70558f307907287')
sha256sums=('5ed97844b23b4409dfe909bbe4bc3077978d510d7749917123edd20d235159ee')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -i -v
	./configure --prefix=/usr \
	            --enable-gxe=no \
	            --enable-libgnome2=no \
	            --enable-ncursesw=no
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" prefix='/usr' install
	mkdir -p $pkgdir/usr/share/doc/gxe/{en,ja}
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/en/* $pkgdir/usr/share/doc/$pkgname/en/
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/ja/* $pkgdir/usr/share/doc/$pkgname/ja/
}
