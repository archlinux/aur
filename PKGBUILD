# Maintainer: Muhkoenig

pkgname=libvips
pkgver=8.7.0
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL 2.1+')
url="https://jcupitt.github.io/libvips/"
depends=('libxml2')
makedepends=(
	'swig'
	'gtk-doc'
	'gobject-introspection'
)
optdepends=(
	'python2: vipsprofile'
	'gobject-introspection: for vips8 python binding'
	'libexif: for EXIF metadata support'
	'fftw: for fourier transforms support'
	'lcms2: transforming images with ICC profiles'
	'libwebp: for WebP image support'
	'openexr: for OpenEXR image support(only read)'
)
provides=('libvips')
conflicts=('libvips-git')
options=('!libtool')
source=("https://github.com/jcupitt/libvips/archive/v${pkgver}.tar.gz")
sha256sums=('79be1d48be6d7426ca41724f920ab6754721449b6bd4ec963ebc3fb4312216b4')

build() {
	cd "$srcdir"/$pkgname-$pkgver

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
