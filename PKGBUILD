# Maintainer: Marco von Rosenberg <codingmarco@gmail.com>

pkgname=glrpt
pkgver=2.4.2
pkgrel=3
pkgdesc="Interactive GUI application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64')
url="http://www.5b4az.org"
license=('GPLv3')
depends=('rtl-sdr'
                   'gtk3'
                   'libglade'
                   'soapysdr')
makedepends=('make')
source=("http://www.5b4az.org/pkg/lrpt/$pkgname-$pkgver-beta.tar.bz2"
               "glrpt.patch")
md5sums=('SKIP'
                    'SKIP')

prepare() {
    cd "$pkgname-$pkgver-beta"
    patch -Np0 -i $srcdir/glrpt.patch
}

build() {
	cd "$pkgname-$pkgver-beta"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver-beta"
	make DESTDIR="$pkgdir/" install
}
