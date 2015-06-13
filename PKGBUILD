# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=xnec2c
pkgver=3.2
pkgrel=1
pkgdesc="GTK+ Antenna EM Modeling Client"
arch=('i686' 'x86_64')
#url="http://5b4az.chronos.org.uk/pages/nec2.html"
#url="http://web.archive.org/web/20110724184011/http://5b4az.chronos.org.uk/pages/nec2.html"
url="http://www.qsl.net/5b4az/pkg/nec2/xnec2c/doc/xnec2c.html"
license=('GPL')
depends=('gtk2')
#source=(http://5b4az.chronos.org.uk/pkg/nec2/$pkgname/$pkgname-$pkgver.tar.bz2
#source=(http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.bz2/d3c1d34da5519cf66ff429de51c6c768/$pkgname-$pkgver.tar.bz2
source=(http://www.qsl.net/5b4az/pkg/nec2/xnec2c/xnec2c-$pkgver.tar.bz2
        $pkgname.desktop
        $pkgname.sh 
        http://bjensen.fedorapeople.org/pkgs/hams/icon/Ham_Icon-1-48.png)
md5sums=('c652ecbe6faee6e4ced6e1b2c48da1a6'
         '02105f9a231b715c41279d5be6d40a7c'
         'e5e3d9bc73159a21c4a5c0902bbb9156'
         '38378f273628bd9a28d3e5f9ff39fa18')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# or add AC_SEARCH_LIBS(clogl, m) to configure.in
	sed -i 's/1.14/1.15/g' {autogen.sh,aclocal.m4}
	./autogen.sh
	./configure --prefix=/usr LDFLAGS=-lm
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/$pkgname/"{doc/images,examples}
	mkdir -p "$pkgdir/usr/share/"{applications,pixmaps}

	make DESTDIR="$pkgdir" install

	install -D -m 755 ../$pkgname.sh "$pkgdir/usr/bin/$pkgname.sh"
	install -m644 doc/images/* "$pkgdir/usr/share/$pkgname/doc/images"
	rm -r doc/images
	install -m644 doc/* "$pkgdir/usr/share/$pkgname/doc"
	install -m644 examples/* "$pkgdir/usr/share/$pkgname/examples"
	install -m644 ../*.desktop "$pkgdir/usr/share/applications/"
	install -m644 ../Ham_Icon-1-48.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

