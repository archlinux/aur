# Maintainer: Michał Lisowski <lisu87@gmail.com>
pkgname=exact-image
pkgver=0.9.1
pkgrel=2
pkgdesc="Fast image manipulation programs"
arch=('i686' 'x86_64')
url="http://exactcode.com/opensource/exactimage/"
license=('GPL2')
depends=('agg')
source=("http://dl.exactcode.de/oss/exact-image/$pkgname-$pkgver.tar.bz2"
	"$pkgname-giflib.patch"
	"$pkgname-libpng.patch"
	"$pkgname-libungif.patch"
	"$pkgname-c-98.patch")
md5sums=('864eddf488c309a02262f4e07b0fe319'
	'd8514b017113431aa2affec169a58764'
	'b64cce768b2757893700d43a8a8feaa7'
	'34a82d7e1044f990b0a7bb433d2f7c18'
	'4d543d6b9ee1f7842c6f6c4b4f159c21')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-giflib.patch"
	patch -p1 -i "$srcdir/$pkgname-libpng.patch"
	patch -p1 -i "$srcdir/$pkgname-libungif.patch"
	patch -p1 -i "$srcdir/$pkgname-c-98.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
