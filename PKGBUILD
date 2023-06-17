# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=neosurf-git
pkgdesc="A NetSurf fork with various improvements"
pkgver=14.r3.gaa1a1e6
pkgrel=1
arch=("x86_64")
makedepends=(git python3 cmake make bash gperf flex bison pkgconf)
depends=(cairo glib2 glibc gtk3 libcurl.so libcrypto.so libgdk_pixbuf-2.0.so libssl.so libpsl libxml2 libjpeg-turbo libpng libwebp libxkbcommon.so pango wayland zlib)
license=(GPL2)
url="https://github.com/CobaltBSD/neosurf"
source=("neosurf"::"git+https://github.com/CobaltBSD/neosurf.git")
sha256sums=("SKIP")

build() {
	cd "neosurf"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build . -- -j 8
}

package() {
	cd "neosurf"
	cmake --install build --prefix "$pkgdir/usr"
}

pkgver() {
	cd "neosurf"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
