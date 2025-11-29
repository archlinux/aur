# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=pmb887x-emu-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Infineon PMB887x-based phones emulator.'
arch=(any)
url='https://github.com/siemens-mobile-hacks/pmb887x-emu'
license=(GPL-2.0)
depends=(
	capstone
	gcc-libs
	glibc
	glib2 libgio-2.0.so libglib-2.0.so
	gnutls
	keyutils
	libaio
	libelf
	libpng
	liburing liburing.so
	lzo
	pixman libpixman-1.so
	zlib
	systemd-libs
	libudev.so
	capstone
)
makedepends=(
	cmake
	alsa-lib
	brltty
	bzip2
	cairo
	capstone
	curl
	fuse3
	gcc-libs
	gdk-pixbuf2
	glib2
	glib2-devel
	gnutls
	gtk3
	keyutils
	libaio
	libcap-ng
	libepoxy
	libpng
	libpulse
	libseccomp
	liburing
	libx11
	libxml2
	libxkbcommon
	lzo
	meson
	multipath-tools
	pam
	pcre2
	python
	python-distlib
	python-setuptools
	python-pip
	python-sphinx
	python-sphinx_rtd_theme
	sdl2
	sdl2_image
	systemd
	zlib
	zstd
)
source=(git+https://github.com/siemens-mobile-hacks/pmb887x-emu)
sha256sums=('SKIP')

prepare() {
	cd "pmb887x-emu"
	git submodule update --init
}

build() {
	cmake -B build -S pmb887x-emu -DCMAKE_BUILD_TYPE=Release
	cmake --build build -j$(nproc)
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

pkgver() {
	cd "pmb887x-emu"
	git describe --long --tags --abbrev=7 | grep -oP '^v\d+\.\d+\.\d+' | sed 's/^v//g'
}
