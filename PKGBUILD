# Maintainer: Muhkoenig

pkgname=libvips
_pkgname=vips
pkgver=8.7.4
pkgrel=1
pkgdesc="A free image processing system"
arch=('i686' 'x86_64')
license=('LGPL 2.1')
url="https://libvips.github.io/libvips/"
depends=('libxml2')
makedepends=(
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
source=("https://github.com/libvips/libvips/releases/download/v${pkgver}/vips-${pkgver}.tar.gz")
sha256sums=('ce7518a8f31b1d29a09b3d7c88e9852a5a2dcb3ee1501524ab477e433383f205')

build() {
	cd "$srcdir"/$_pkgname-$pkgver

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/$_pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
