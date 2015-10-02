# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=irrlamb
pkgver=0.2.1
pkgrel=1
pkgdesc="a 3D game that probably involves a lot of physics and frustrating gameplay."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/irrlamb"
license=('GPL3')
depends=('gcc-libs' 'bullet' 'irrlicht' 'freetype2' 'lua' 'sqlite' 'openal' 'libvorbis' 'libogg' 'sh')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
sha256sums=('e46fa1ccc8e991b38fcab3b6a27b6706c3c1551503df01c965dd2838c7161a22')

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

