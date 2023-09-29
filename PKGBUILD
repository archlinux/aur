# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=neosurf-git
pkgdesc="A NetSurf fork with various improvements"
pkgver=16.r0.g21ddcde
pkgrel=3
arch=("x86_64")
makedepends=(
	git
	python3
	cmake
	ninja
	zsh
	gperf
	flex
	bison
	pkgconf
)
depends=(
	cairo
	glib2
	glibc
	gtk3
	libcurl.so
	libcrypto.so
	libgdk_pixbuf-2.0.so
	libssl.so
	libpsl
	libxml2
	libjpeg-turbo
	libpng
	libwebp
	libxkbcommon.so
	pango
	wayland
	zlib
)
license=(GPL2)
url="https://github.com/CobaltBSD/neosurf"
source=(
	"neosurf"::"git+https://github.com/CobaltBSD/neosurf.git"
	'neosurf-gtk.desktop'
	'neosurf-vi.desktop'
)
sha256sums=(
	'SKIP'
	'd74ca71905c6336357ad7be9eb3be874623a3c86bddcc08501854e053f9e79f3'
	'bab0e4af03f7ecd5f86cc37c9ca6990e4ad73a4db4ee5248f2cbcde1dca5e28d'
)

build() {
	cd "neosurf"
	cmake -B build -GNinja -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build build
}

package() {
	install -Dm 664 neosurf-gtk.desktop -t "$pkgdir/usr/share/applications"
	install -Dm 664 neosurf-vi.desktop -t "$pkgdir/usr/share/applications"
	cd "neosurf"
	cmake --install build --prefix "$pkgdir/usr"
}

pkgver() {
	cd "neosurf"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
