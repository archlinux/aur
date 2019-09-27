# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=choria
pkgver=0.5.0
pkgbuild=r1666
pkgrel=1
pkgdesc="Finally, an MMORPG that's all about grinding and doing chores."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/choria"
license=('GPL3')
depends=('gcc-libs' 'sdl2' 'sdl2_image' 'openal' 'libvorbis' 'libogg' 'freetype2' 'lua' 'glm' 'sqlite' 'jsoncpp' 'tinyxml2' 'zlib')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}${pkgbuild}-src.tar.gz")

sha256sums=('88d70627bebec61a4978ba5e701cb8679b9fcfdcf564f348e1f6ce7fcdfa44c7')

prepare() {
	cd $srcdir/$pkgname-$pkgver$pkgbuild
}

build() {
	cd $srcdir/$pkgname-$pkgver$pkgbuild
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver$pkgbuild"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}

