# Maintainer: detrito <detrito@inventati.org>
# Contributor: Beej Jorgensen <beej@beej.us>
# Contributor: Martin Lüthi <mluethi@tnoo.net>
pkgname=survex
pkgver=1.2.41
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
sha512sums=('6568b4295eb2367a6dde003913129af0d3c41c27972df522ce07e501ac7cec6d793f0af79e0d2e3fee0e541afeabfc0b4278deb34a5d5ac492b1f86539d0ad9e'
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

