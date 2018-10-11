# Maintainer: Eric Richter <richteer@lastprime.net>
pkgname=ripright
pkgver=0.11
pkgrel=3
pkgdesc="A minimal automatic CD ripper and tagging utility"
arch=('i686' 'x86_64')
url="http://www.mcternan.me.uk/ripright"
license=('GPL2')
depends=('curl' 'flac' 'cdparanoia' 'libmagick6' 'libdiscid')
makedepends=()
optdepends=()
provides=('ripright')
#install=${pkgname}
source=("http://www.mcternan.me.uk/ripright/software/$pkgname-$pkgver.tar.gz")
md5sums=('51719e181ef7a852f5b854d4f43a56c6')

build() {
	cd $pkgname-$pkgver
	export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig/
	MagickWand_CFLAGS="`pkg-config --cflags MagickWand-6.Q16HDRI`" MagickWand_LIBS="`pkg-config --libs MagickWand-6.Q16HDRI`" ./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
