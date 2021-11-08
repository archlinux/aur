# Maintainer: Beej <beej@beej.us>
# Maintainer: Martin Lüthi <mluethi@tnoo.net>
# Contributor: Beej Jorgensen <beej@beej.us>
# Contributor: Martin Lüthi <mluethi@tnoo.net>
pkgname=survex
pkgver=1.4.1
pkgrel=1
pkgdesc="Cave survey software"
arch=('i686' 'x86_64')
url="http://survex.com/"
license=('GPL')
depends=('mesa' 'wxgtk3' 'ffmpeg' 'proj>=7.2.0' 'glu')
makedepends=('desktop-file-utils')
install=${pkgname}.install
source=(http://survex.com/software/$pkgver/$pkgname-$pkgver.tar.gz
	http://survex.com/software/sample.tar.gz
)
sha512sums=('a8076bf40def9c576dea9e144dc326a0de3f02a6386bc78b7bb8fa7b6e3faaf2001170334f8fcebebd4eac48228f82c55a0329f8abd01d54e826a3f1e0e1531d'
            'af915b8fcd3949160049946b6a195750f4d16689eb7a341dbad1c2c4cfd36d85c955abbf9e6ecb0f26db0ae073ff76e0d9c1cb0591d6d5d9c1b7a8cd80a74da9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export WX_CONFIG="wx-config-gtk3"

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

