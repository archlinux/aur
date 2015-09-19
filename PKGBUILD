# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=irrlamb
pkgver=0.2.0
pkgrel=1
pkgdesc="a 3D game that probably involves a lot of physics and frustrating gameplay."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/irrlamb"
license=('GPL3')
depends=('gcc-libs' 'bullet' 'irrlicht' 'freetype2' 'lua' 'sqlite' 'openal' 'libvorbis' 'libogg' 'sh')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1d50639cef5e93a91260ca55f456d5a95fd30b2305d35e8e2060eb8c6ee1105e')

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

