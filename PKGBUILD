# Maintainer: Alan Witkowski <alan.witkowski+aur@gmail.com>
pkgname=irrlamb
pkgver=1.0.1
pkgbuild=r612
pkgrel=1
pkgdesc="3D game that probably involves a lot of physics and frustrating gameplay."
arch=('i686' 'x86_64')
url="https://github.com/jazztickets/irrlamb"
license=('GPL3')
depends=('gcc-libs' 'freetype2' 'sqlite' 'openal' 'libvorbis' 'libogg' 'libjpeg-turbo' 'libpng' 'zlib')
makedepends=('cmake')
source=("https://github.com/jazztickets/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}${pkgbuild}-src.tar.gz")
sha256sums=('743e42a6ef75181b9313d2b7d5a6ff93fbaa42ab31e2043726932f6e2a8dbbf2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}${pkgbuild}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}${pkgbuild}"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}

