# Maintainer: detrito <detrito@inventati.org>
# Contributor: Thomas Holder <thomas@thomas-holder.de>
# Contributor: Beej Jorgensen <beej@beej.us>
# Contributor: Martin Lüthi <mluethi@tnoo.net>
pkgname=survex
pkgver=1.4.5
pkgrel=1
pkgdesc="Cave survey software"
arch=('i686' 'x86_64')
url="http://survex.com/"
license=('GPL')
depends=('mesa' 'wxwidgets-gtk3' 'ffmpeg' 'proj>=7.2.0' 'glu')
makedepends=('desktop-file-utils')
install=${pkgname}.install
source=(http://survex.com/software/$pkgver/$pkgname-$pkgver.tar.gz
	http://survex.com/software/sample.tar.gz
)
sha512sums=('39864905c61e1d70d119ddf9016360c56da59de3d60bc6428c04e79c76fad9e1e0ce8dd1ca1953442855b086c11ce99246f33aa5d44d2389edef682683ec4b5d'
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

