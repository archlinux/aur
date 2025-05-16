# Maintainer: jazztickets <amF6enRpY2tldHNAZ21haWwuY29tCg==>
pkgname=irrlamb
pkgver=1.0.7
pkgbuild=d99c154
pkgfullname=${pkgname}-${pkgver}-${pkgbuild}
pkgrel=1
pkgdesc="3D game that probably involves a lot of physics and frustrating gameplay"
arch=('i686' 'x86_64')
url="https://irrlamb.gitlab.io"
license=('GPL3')
depends=('gcc-libs' 'freetype2' 'openal' 'libvorbis' 'libogg' 'libjpeg-turbo' 'libpng' 'sqlite' 'zlib')
makedepends=('cmake')
source=("https://gitlab.com/jazztickets/uploads/-/raw/main/${pkgfullname}-src.tar.gz")
sha256sums=('a365f381eba8fa73e519dbc2e6c78206d25bdb915184edd2a7262ef72eddb794')

build() {
	cd "$srcdir/$pkgfullname"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$pkgfullname"
	make DESTDIR="$pkgdir/" install

	# remove standard license
	rm $pkgdir/usr/share/doc/$pkgname/LICENSE
}

