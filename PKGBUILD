# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=mathopd
pkgver=1.6b15
pkgrel=1
pkgdesc=""
arch=(i686 x86_64)
url="http://www.mathopd.org/"
license=('BSD')
source=("http://www.mathopd.org/dist/$pkgname-$pkgver.tar.gz")
md5sums=('d17bf698470fccf48b9cf5a70f5b3bc2')

build() {
	cd "$pkgname-$pkgver"/src
	PREFIX=/usr SBINDIR=/usr/bin make
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -m755 -p $pkgdir/{etc,usr/{bin,share/doc/$pkgname}}
	cp ./doc/* $pkgdir/usr/share/doc/$pkgname
	install -TDm644 ./doc/sample.cfg $pkgdir/etc/$pkgname/$pkgname.cfg
	cd ./src
	make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="$pkgdir/" install
}
