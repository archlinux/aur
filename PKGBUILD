# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

#	OPTIONAL:libmux \
#	OPTIONAL:libpomp \
#	OPTIONAL:libARMedia

pkgname=libarstream2-git
pkgver=r156.bcd93a5
pkgrel=2
pkgdesc="Parrot Streaming Library"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsal-git)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('libarstream2::git+https://github.com/Parrot-Developers/libARStream2'
        'libarstream2-Makefile'
        'Config-linux-config.h'
        'LICENSE')
sha256sums=('SKIP'
            'c1554a5e0b68e1d5b9e08434b509b78215fb89d2aa64ced5fc53f2680982df3c'
            '5956b54ef47ad26df51991a4aa7002abdcb524a51b455d040f55b4d11a4f44a7'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/libarstream2"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp "$srcdir/libarstream2-Makefile" "$srcdir/libarstream2/Makefile"
	cp "$srcdir/Config-linux-config.h" "$srcdir/libarstream2/Includes/config.h"
}

build() {
	cd "$srcdir/libarstream2"
	make
}

package() {
	# Install headers
	mkdir -p "$pkgdir/usr/include/libARStream2"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_error.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_h264_filter.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_h264_parser.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_h264_sei.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_h264_writer.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_rtp_receiver.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_rtp_sender.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_stream_recorder.h" "$pkgdir/usr/include/libARStream2/"
	cp "$srcdir/libarstream2/Includes/libARStream2/arstream2_stream_receiver.h" "$pkgdir/usr/include/libARStream2/"

	# Install lib
	mkdir -p "$pkgdir/usr/lib"
	cp "$srcdir/libarstream2/libarstream2.so" "$pkgdir/usr/lib/"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
