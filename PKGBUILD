# Maintainer: Chris Sakalis <chrissakalis@gmail.com>
pkgname=gimp-plugin-wavelet-sharpen
pkgver=0.1.2
pkgrel=2
pkgdesc="Enhances apparent sharpness of an image by increasing contrast in high frequency space."
arch=('i686' 'x86_64')
url="http://registry.gimp.org/node/9836"
license=('GPL')
groups=()
depends=('gimp')
provides=('wavelet-sharpen')
source=(http://registry.gimp.org/files/wavelet-sharpen-$pkgver.tar.gz)
md5sums=('6e2b06d3dcac573c236662fd4922c61d')
sha256sums=('1cf7ee72bc4cdb721ecc3edf995904f508f2b2295006a5762c2f8878cc0c146f')

prepare() {
	cd "$srcdir/wavelet-sharpen-$pkgver"
	sed -i "2s/LIBS.*/\0 -lm/g" src/Makefile
}

build() {
	cd "$srcdir/wavelet-sharpen-$pkgver"
	make
}

package() {
	cd "$srcdir/wavelet-sharpen-$pkgver/po"
	for L in de ru it pl et;
	do
		install -Dm 0664 $L.mo "${pkgdir}/usr/share/locale/$L/LC_MESSAGES/gimp20-wavelet-sharpen-plug-in.mo"
	done
	cd "$srcdir/wavelet-sharpen-$pkgver/src"
	install -Dm 0755 wavelet-sharpen "${pkgdir}/usr/lib/gimp/2.0/plug-ins/wavelet-sharpen"
}
