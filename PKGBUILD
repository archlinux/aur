# Maintainer: jazztickets <jazztickets@gmail.com>
pkgname=irrlamb
pkgver=1.0.3
pkgbuild=r653
pkgrel=2
pkgdesc="3D game that probably involves a lot of physics and frustrating gameplay."
arch=('i686' 'x86_64')
url="https://irrlamb.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'freetype2' 'sqlite' 'openal' 'libvorbis' 'libogg' 'libjpeg-turbo' 'libpng' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgname}-${pkgver}${pkgbuild}-src.tar.gz")
sha256sums=('5a85eca58714ce80df4ab271fe2619eb7e180fab7b8fafad4db8391921f111ea')

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

