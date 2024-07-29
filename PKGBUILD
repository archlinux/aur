# Maintainer: jazztickets <jazztickets@gmail.com>
pkgname=irrlamb
pkgver=1.0.5
pkgbuild=r664
pkgrel=1
pkgdesc="3D game that probably involves a lot of physics and frustrating gameplay."
arch=('i686' 'x86_64')
url="https://irrlamb.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'freetype2' 'sqlite' 'openal' 'libvorbis' 'libogg' 'libjpeg-turbo' 'libpng' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgname}-${pkgver}${pkgbuild}-src.tar.gz")
sha256sums=('c5528e556ebf5049d54528ad8a79b307f1d74712a4b16ffff780b9fc1b1b2ddc')

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

