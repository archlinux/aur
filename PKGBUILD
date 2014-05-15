# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Clemens John <clemens-john@gmx.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: TheHoff <forums>

pkgname=devil-ilut
pkgver=1.7.8
pkgrel=2
pkgdesc='Library for reading several different image formats (includes ILUT)'
arch=('i686' 'x86_64')
url='http://openil.sourceforge.net/'
depends=('libpng' 'libmng' 'jasper' 'lcms' 'openexr') # libjpeg & libtiff are implicitly satisfied
install=devil.install
options=('!docs' '!emptydirs')
license=('GPL')
provides=('devil')
conflicts=('devil')
source=(http://downloads.sourceforge.net/openil/DevIL-$pkgver.tar.gz libpng14.patch)
md5sums=('7918f215524589435e5ec2e8736d5e1d'
         '0f839ccefd43b0ee8b4b3f99806147fc')

build() {
	cd devil-$pkgver
	patch -Np1 -i ../libpng14.patch

	if [[ $CARCH != x86_64 ]]; then
		OPTIMIZATION=--disable-sse3
	fi

	./configure --prefix=/usr --enable-ILU --enable-ILUT \
		--enable-jpeg --enable-tiff --disable-squish --disable-lcms \
		--disable-sdl --disable-x11 --disable-opengl --disable-shm --disable-render $OPTIMIZATION

	make
}

package() {
	cd devil-$pkgver
	make prefix="${pkgdir}/usr" install
}
