# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=neosurf-git
pkgdesc="A NetSurf fork with various improvements"
pkgver=16.r21.gd6c77f2
pkgrel=1
arch=("x86_64")
makedepends=(
	git
	python3
	cmake
	ninja
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
	libjpeg
	libpng
	libwebp
	libxkbcommon.so
	pango
	wayland
	zlib
)
license=('GPL-2.0-only')
url="https://github.com/CobaltBSD/neosurf"
source=(
	"neosurf"::"git+https://github.com/CobaltBSD/neosurf.git"
	'neosurf-gtk.desktop'
	'neosurf-vi.desktop'
)
b2sums=(
	'SKIP'
	'03d406b98179c20c541b3b3263a55ecdeca0fee91cce0732a7437ffd51cfd0207d6ddd13a4dc3fc8156712249f3082c6a3473f80afdfce1a2da72fbec471e3f0'
	'777a433c6f7f1b00b8d6d5387944e4ef2961b6b15d3eb77611df34e1f03bb477112a49c60431e261c82a5b2912587a69ac16b7a7fb92fbf5eb89d75b75b19ceb'
)

build() {
	cd "neosurf"
	cmake \
		-B build \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX="/usr"

	cmake --build build
}

package() {
	install -Dm 664 neosurf-gtk.desktop -t "$pkgdir/usr/share/applications"
	install -Dm 664 neosurf-vi.desktop -t "$pkgdir/usr/share/applications"
	cd "neosurf"
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "neosurf"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
