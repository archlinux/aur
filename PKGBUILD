# Maintainer: Beej <beej@beej.us>
# Maintainer: Martin Lüthi <mluethi@tnoo.net>
# Contributor: Beej Jorgensen <beej@beej.us>
# Contributor: Martin Lüthi <mluethi@tnoo.net>
pkgname=survex
pkgver=1.2.24
pkgrel=1
pkgdesc="Cave survey software"
arch=('i686' 'x86_64')
url="http://survex.com/"
license=('GPL')
depends=('mesa' 'wxgtk' 'ffmpeg' 'proj' 'glu')
makedepends=('desktop-file-utils')
install=${pkgname}.install
source=(http://survex.com/software/$pkgver/$pkgname-$pkgver.tar.gz
	http://survex.com/software/sample.tar.gz
)
sha512sums=('25172146ad3de3736adecc90d363f3ad911a82ffc1062c3fd35c46d3a06f8d994084acc672c92299b01aa7224d6c79850482bb38b1a67e54884f41561e16b740'
            'af915b8fcd3949160049946b6a195750f4d16689eb7a341dbad1c2c4cfd36d85c955abbf9e6ecb0f26db0ae073ff76e0d9c1cb0591d6d5d9c1b7a8cd80a74da9')

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

