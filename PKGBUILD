# Maintainer: detrito <detrito@inventati.org>
# Contributor: Thomas Holder <thomas@thomas-holder.de>
# Contributor: Beej Jorgensen <beej@beej.us>
# Contributor: Martin Lüthi <mluethi@tnoo.net>
pkgname=survex
pkgver=1.4.15
pkgrel=2
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
sha512sums=('bb66b40ca7e246508b3064a4bcf1b72e45a7702f2d3bfa91ab33425d020f2098be6a44f79cf6029804627e993bd32748471cc47ec3d0e723a677a657c5e861e0'
            'b10901edf583ec9c3fa04eaee9c264adfe098e063d6b97109387736b991b69fb7ad84d8687299e5ee3f2cc1a67e59c07dab7f9b05991b507e7a76dbd253de374')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	cd "$srcdir/loser"

	install -m 755 -d "$pkgdir"/usr/share/$pkgname/samples
	cp -r * "$pkgdir"/usr/share/$pkgname/samples
}

