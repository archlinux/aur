# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=libarstream-git
pkgver=r287.ddf0b48
pkgrel=2
pkgdesc="ARSDK Streaming Library"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsal-git libarnetworkal-git libarnetwork-git)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarstream::git+https://github.com/Parrot-Developers/libARStream'
        'libarstream-Makefile'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            '5134688008cc290a31221df63e38f360482cda4d22d246742c957293bda3d65f'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarstream"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp "$srcdir/libarstream-Makefile" "$srcdir/libarstream/Makefile"
	cp "$srcdir/Config-linux-config.h" "$srcdir/libarstream/Includes/config.h"
}

build() {
	cd "$srcdir/libarstream"
	make
}

package() {
	# Install headers
	mkdir -p "$pkgdir/usr/include/libARStream"
	cp "$srcdir/libarstream/Includes/libARStream/ARStream.h" "$pkgdir/usr/include/libARStream/"
	cp "$srcdir/libarstream/Includes/libARStream/ARSTREAM_Error.h" "$pkgdir/usr/include/libARStream/"
	cp "$srcdir/libarstream/Includes/libARStream/ARSTREAM_Filter.h" "$pkgdir/usr/include/libARStream/"
	cp "$srcdir/libarstream/Includes/libARStream/ARSTREAM_Reader.h" "$pkgdir/usr/include/libARStream/"
	cp "$srcdir/libarstream/Includes/libARStream/ARSTREAM_Reader2.h" "$pkgdir/usr/include/libARStream/"
	cp "$srcdir/libarstream/Includes/libARStream/ARSTREAM_Sender.h" "$pkgdir/usr/include/libARStream/"
	cp "$srcdir/libarstream/Includes/libARStream/ARSTREAM_Sender2.h" "$pkgdir/usr/include/libARStream/"

	# Install lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarstream/libarstream.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
