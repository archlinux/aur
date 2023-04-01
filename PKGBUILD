# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Mark Rosenstand <mark@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Chris Brannon <chris@the-brannons.com>

pkgname=webfs
pkgver=1.21
pkgrel=17
pkgdesc="Simple and instant http server for mostly static content."
arch=(x86_64)
url="http://linux.bytesex.org/misc/webfs.html"
license=("GPL")
depends=('mime-types' 'openssl')
backup=('etc/conf.d/webfsd')
source=(https://dl.bytesex.org/releases/webfs/webfs-${pkgver}.tar.gz
        webfsd.conf
        webfs.patch
        webfsd.service)
md5sums=('6dc125fe160479404147e7bbfc781dbc'
         'b2c1ab041a82acd8391b06dc38d986be'
         '7294edcec2589df04bb775270d56536e'
         'e1202dd915cba1a02e0016aa3a516b4a')
sha256sums=('98c1cb93473df08e166e848e549f86402e94a2f727366925b1c54ab31064a62a'
            '35065c9fd1e493b5c6ac4582f783905d2d7755883e8234f1db7fa79ebb34a657'
            'a648b7be3872300b20d2871dcc05a024e66e6dda68fb89da04c9f83fb0c6d3df'
            'b174d0bfda8db95144b5a128e4de69820ff9e5be2715c99d809911c6961be939')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	patch -i "$srcdir/webfs.patch"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make prefix=/usr DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/webfsd.conf"     "$pkgdir/etc/conf.d/webfsd"
	install -Dm644 "$srcdir/webfsd.service"  "$pkgdir/usr/lib/systemd/system/webfsd.service"
}
