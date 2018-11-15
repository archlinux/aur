# Maintainer: Marco von Rosenverg <codingmarco@gmail.com>

pkgname=glrpt
pkgver=1.6
pkgrel=1
pkgdesc="Interactive GUI application for receiving, decoding and displaying LRPT images from the Russian Meteor-M type of weather satellites"
arch=('x86_64')
url="http://www.5b4az.org"
license=('GPLv3')
depends=('rtl-sdr'
                   'gtk3'
                   'libglade')
makedepends=('make')
source=("http://www.5b4az.org/pkg/lrpt/$pkgname-$pkgver.tar.bz2")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	
	# I have to do this here and not in a .install file because I need files from the srcdir directory
	if [ -f ~/glrpt/glrptrc ]; then
        mv ~/glrpt/glrptrc ~/glrpt/glrptrc.old-1.4.1
    fi
	cd "$srcdir/$pkgname-$pkgver"
	cp glrpt/glrptrc ~/glrpt/
}
