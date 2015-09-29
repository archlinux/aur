# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=choria
pkgver=0.4.2
pkgrel=1
pkgdesc="a 2D MMORPG that's all about grinding and doing chores."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'irrlicht' 'sqlite')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz")

sha256sums=('28f794394d2bdbff9b3c97f1cf16de2f9dffb84551f6f685d0d2110782efc172')

prepare() {
	cd $srcdir/$pkgname-$pkgver
}

build() {
	cd $srcdir/$pkgname-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}

