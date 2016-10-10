# Maintainer: Rudy Matela <rudy@matela.com.br>
pkgname=nfdump
pkgver=1.6.15
pkgrel=1
pkgdesc="A set of tools to collect and process netflow data."
arch=('i686' 'x86_64')
url="https://github.com/phaag/nfdump/"
license=('BSD')
depends=('glibc')
makedepends=('flex' 'bison' 'rrdtool')
source=("https://github.com/phaag/nfdump/archive/v1.6.15.tar.gz")
md5sums=('6f52c01099a2a74e451ebfb17bf92da8')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr \
	  --enable-nfprofile \
	  --enable-nftrack \
	  --enable-sflow
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/share/licenses/nfdump
	install -m644 "$srcdir/$pkgname-$pkgver/COPYING" $pkgdir/usr/share/licenses/nfdump
}
