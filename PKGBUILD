# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=neosurf-git
pkgdesc="A NetSurf fork with various improvements"
pkgver=16.r0.g21ddcde
pkgrel=2
arch=("x86_64")
makedepends=(git python3 cmake ninja zsh gperf flex bison pkgconf)
depends=(cairo glib2 glibc gtk3 libcurl.so libcrypto.so libgdk_pixbuf-2.0.so libssl.so libpsl libxml2 libjpeg-turbo libpng libwebp libxkbcommon.so pango wayland zlib)
license=(GPL2)
url="https://github.com/CobaltBSD/neosurf"
source=("neosurf"::"git+https://github.com/CobaltBSD/neosurf.git")
sha256sums=("SKIP")

build() {
	cd "neosurf"
	cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build build
}

package() {
	cd "neosurf"
	cmake --install build --prefix "$pkgdir/usr"
}

pkgver() {
	cd "neosurf"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
