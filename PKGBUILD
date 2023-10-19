# Maintainer: James Bowling <kf5u AT pm DOT me>

pkgname=wsjtx-improved
_pkgname=wsjtx
pkgver=2.6.2
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65) - Improved version by DG2YCB - Superbuild version, hamlib not required"
arch=('x86_64')
url="https://sourceforge.net/projects/wsjt-x-improved/"
license=('GPL3')

depends=(
	'boost-libs'
	'fftw'
	'gcc-libs'
	'libusb'
	'qt5-base'
	'qt5-multimedia'
	'qt5-serialport'
	'qt5-tools'
	'readline'
)

makedepends=(
	'cmake'
	'asciidoc'
	'asciidoctor'
	'boost'
	'gcc-fortran'
	'git'
	'texinfo'
)

install=wsjtx-improved.install

provides=('wsjtx')
conflicts=('wsjtx')
source=("https://downloads.sourceforge.net/project/wsjt-x-improved/WSJT-X_v$pkgver/Source%20code/"$_pkgname-$pkgver"_improved_PLUS.tgz")
md5sums=('16b1adc60a2aad1703168bd763535bd0')
sha1sums=('63270fb769edb9ffe7aea4f01f98f9f9f18ec576')

options=(!lto)

build() {
	mkdir -p $srcdir/build
	cd $srcdir/build
	cmake \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		$srcdir/$_pkgname-$pkgver
	make || return 1
}

package() {
	cd "$srcdir/build"
	make DESTDIR=${pkgdir} install
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/ContinentOnBand.wav" "$pkgdir/opt/wsjtx/sounds/ContinentOnBand.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/Continent.wav" "$pkgdir/opt/wsjtx/sounds/Continent.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/CQ.wav" "$pkgdir/opt/wsjtx/sounds/CQ.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/CQZoneOnBand.wav" "$pkgdir/opt/wsjtx/sounds/CQZoneOnBand.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/CQZone.wav" "$pkgdir/opt/wsjtx/sounds/CQZone.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/DXcall.wav" "$pkgdir/opt/wsjtx/sounds/DXcall.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/DXCCOnBand.wav" "$pkgdir/opt/wsjtx/sounds/DXCCOnBand.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/DXCC.wav" "$pkgdir/opt/wsjtx/sounds/DXCC.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/GridOnBand.wav" "$pkgdir/opt/wsjtx/sounds/GridOnBand.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/Grid.wav" "$pkgdir/opt/wsjtx/sounds/Grid.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/ITUZoneOnBand.wav" "$pkgdir/opt/wsjtx/sounds/ITUZoneOnBand.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/ITUZone.wav" "$pkgdir/opt/wsjtx/sounds/ITUZone.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/MyCall.wav" "$pkgdir/opt/wsjtx/sounds/MyCall.wav"
	install -Dm744 "$srcdir/build/wsjtx-prefix/src/wsjtx/sounds/_Zone.wav" "$pkgdir/opt/wsjtx/sounds/_Zone.wav"
	rm -rf $pkgdir/home
}

