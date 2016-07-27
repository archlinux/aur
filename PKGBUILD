# Maintainer: Charlie Wolf <charlie@wolf.is>

pkgname=pushpin
pkgver=1.11.0
pkgrel=2
pkgdesc="Reverse proxy for realitme web services"
arch=('x86_64' 'i686')
url="https://github.com/fanout/$pkgname"
license=('MIT')
depends=("qt5-base" "zeromq" "zurl" "mongrel2")
makedepends=("qt5-base" "zeromq")
source=("https://dl.bintray.com/fanout/source/$pkgname-$pkgver.tar.bz2" "$pkgname.service")
md5sums=("9a6b9d374406f094842471f0a4587baa" "3c2d447f5769e37067e627832da0051a")

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
