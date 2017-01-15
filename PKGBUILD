# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname=pushpin
pkgver=1.14.0
pkgrel=1
pkgdesc="Reverse proxy for realitme web services"
arch=('x86_64' 'i686')
url="https://github.com/fanout/$pkgname"
license=('MIT')
depends=("qt5-base" "zeromq" "zurl" "mongrel2")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2" "$pkgname.service")
md5sums=("07b84034e4bb30dcbe93004b1ff6a09a" "3c2d447f5769e37067e627832da0051a")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --qtselect=5
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir/" install
	mkdir -p $pkgdir/usr/lib/systemd/system
        cp $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system
}
