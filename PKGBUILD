# Maintainer: Andreas Muetzel <andreas dot muetzel at gmx dot net>

pkgname=gst-shark
pkgver=0.8.1
pkgrel=1
pkgdesc="A collection of GStreamer tracing and debugging tools"
arch=(x86_64)
url="https://developer.ridgerun.com/wiki/index.php?title=GstShark"
url="https://github.com/RidgeRun/${pkgname}"
license=('LGPL')
depends=('glib2' 'gstreamer' 'glibc' 'graphviz')
makedepends=('meson')
# provides=('libgstshark.so=0-64')
source=("https://github.com/RidgeRun/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d6fdfca8523412a30ce1a942ddabcbaede440623b69c9bb480a1006f4a28a112')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	arch-meson builddir
	ninja -C builddir
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir/" ninja install -C builddir
}
