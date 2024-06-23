# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Contributor: Joermungand <joermungand at gmail dot com>

pkgname=avldrums-lv2-git
pkgver=0.7.3.r0.g27747bc
pkgrel=1
pkgdesc="Dedicated AVLDrumkits LV2 Plugin from x42"
arch=('i686' 'x86_64')
url="https://github.com/x42/avldrums.lv2"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('pango' 'libglvnd' 'lv2-host')
makedepends=('git' 'lv2' 'glu' 'xorgproto')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/x42/avldrums.lv2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-*}"
    make submodules
    make
}

package() {
	depends+=(libavahi-common.so libavahi-gobject.so 
	libboost_iostreams.so
	libcurl.so libfftw3f.so 
	libgdk-3.so libgdk_pixbuf-2.0.so 
	libgio-2.0.so
	libglib-2.0.so 
	libgobject-2.0.so 
	libjack.so liblilv-0.so 
	liblo.so liblrdf.so
	libpangocairo-1.0.so 
	libpango-1.0.so 
	libsndfile.so 
	libzita-convolver.so
	libzita-resampler.so)
  
	cd "$srcdir/${pkgname%-*}"
	make DESTDIR="$pkgdir/" install PREFIX=/usr
}

