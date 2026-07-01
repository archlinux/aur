# Maintainer: detrito <detrito@inventati.org>
# Contributor: Thomas Holder <thomas@thomas-holder.de>
# Contributor: Beej Jorgensen <beej@beej.us>
# Contributor: Martin Lüthi <mluethi@tnoo.net>
pkgname=survex
pkgver=1.4.22
pkgrel=1
pkgdesc="Cave survey software"
arch=('i686' 'x86_64')
url="http://survex.com/"
license=('GPL')
depends=('mesa' 'wxwidgets-gtk3' 'ffmpeg' 'proj>=7.2.0' 'glu' 'gdal')
makedepends=('desktop-file-utils')
install=${pkgname}.install
source=(http://survex.com/software/$pkgver/$pkgname-$pkgver.tar.gz
	http://survex.com/software/sample.tar.gz
)
sha512sums=('fa10426e44543a4e231adccc8f9b275b28cffe4371b6ce3f0a6f9617bcef797d4b47b8ce4bd877d4d802115b9b805aa264c00821e50179e5627aa9ccb168f65c'
            'b10901edf583ec9c3fa04eaee9c264adfe098e063d6b97109387736b991b69fb7ad84d8687299e5ee3f2cc1a67e59c07dab7f9b05991b507e7a76dbd253de374')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	cd "$srcdir/sample/loser"

	install -m 755 -d "$pkgdir"/usr/share/$pkgname/samples
	cp -r * "$pkgdir"/usr/share/$pkgname/samples
}

