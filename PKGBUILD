# Maintainer: Engine Feeder <enginefeeder101@archlinux.info>
pkgname=getxbook
pkgver=1.2
pkgrel=2
pkgdesc="getxbook is a collection of tools to download books from Google Books' \"Book Preview\" (getgbook), Amazon's \"Look Inside the Book\" (getabook) and Barnes & Noble's \"Book Viewer\" (getbnbook)."
arch=('x86_64')
url="https://njw.me.uk/getxbook/"
license=('custom:ISC')
source=("$url$pkgname-$pkgver.tar.xz"
        "error.patch")
sha512sums=('fec397d4fd979421658f7ef9535f3c25369c8bd4ea2f9adcd719f760fd01265ed789f9eca34374b245c24acd485b951c91fa92a36d5b6401a0e0bf4db746788d'
            'fe157499158205d97abdb3a0923fea709707d73a20f507f042c125de11012257165c66900de4439f1d68f5d63182ebc450598679f9e3ca4b5b6a88b3a6970ceb')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 -i "$srcdir/error.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -D -m644 "$srcdir/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
