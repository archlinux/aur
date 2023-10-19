# Maintainer: James Bowling <kf5u AT pm DOT me>

pkgname=jtdx-improved
_pkgname=jtdx
pkgver=2.2.159
pkgrel=1
pkgdesc="For amateur radio communication using very weak signals. Forked from WSJT-X. JTDX Improved by DG2YCB"
arch=('x86_64')
url="https://sourceforge.net/projects/jtdx-improved/"
license=('GPL3')

depends=(
	'fftw'
	'hamlib>=4.5'
	'libusb'
	'qt5-base'
	'qt5-multimedia'
	'qt5-serialport'
	'qt5-tools'
	'qt5-websockets'
	'readline'
)

makedepends=(
	'cmake'
	'asciidoc'
	'asciidoctor'
	'boost'
	'boost-libs'
	'gcc-fortran'
	'gcc-libs'
	'git'
	'texinfo'
)

install=jtdx-improved.install

provides=('jtdx')
conflicts=('jtdx')
source=("https://downloads.sourceforge.net/project/jtdx-improved/${_pkgname}_${pkgver}/Source%20code/${_pkgname}_${pkgver}_improved_source.zip")
md5sums=('539cfd3092b5a04977ed204166355f86')
sha1sums=('5a9b2b22243e0f511fb6472d913ee277714e7447')

build() {
	unzip -o ${_pkgname}_${pkgver}_improved_source.zip
	mkdir -p $srcdir/build
	cd $srcdir/build
  		
	cmake \
		-Wno-dev \
    	-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \
		-D WSJT_SKIP_MANPAGES=ON \
		-D WSJT_GENERATE_DOCS=OFF \
    	../jtdx
  	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR=${pkgdir} install
	install -Dm744 "$srcdir/jtdx/sounds/CQ.wav" "$pkgdir/opt/jtdx/sounds/CQ.wav"
	install -Dm744 "$srcdir/jtdx/sounds/CQZoneOnBand.wav" "$pkgdir/opt/jtdx/sounds/CQZoneOnBand.wav"
	install -Dm744 "$srcdir/jtdx/sounds/CQZone.wav" "$pkgdir/opt/jtdx/sounds/CQZone.wav"
	install -Dm744 "$srcdir/jtdx/sounds/DXcall.wav" "$pkgdir/opt/jtdx/sounds/DXcall.wav"
	install -Dm744 "$srcdir/jtdx/sounds/DXCCOnBand.wav" "$pkgdir/opt/jtdx/sounds/DXCCOnBand.wav"
	install -Dm744 "$srcdir/jtdx/sounds/DXCC.wav" "$pkgdir/opt/jtdx/sounds/DXCC.wav"
	install -Dm744 "$srcdir/jtdx/sounds/GridOnBand.wav" "$pkgdir/opt/jtdx/sounds/GridOnBand.wav"
	install -Dm744 "$srcdir/jtdx/sounds/Grid.wav" "$pkgdir/opt/jtdx/sounds/Grid.wav"
	install -Dm744 "$srcdir/jtdx/sounds/ITUZoneOnBand.wav" "$pkgdir/opt/jtdx/sounds/ITUZoneOnBand.wav"
	install -Dm744 "$srcdir/jtdx/sounds/ITUZone.wav" "$pkgdir/opt/jtdx/sounds/ITUZone.wav"
	install -Dm744 "$srcdir/jtdx/sounds/MyCall.wav" "$pkgdir/opt/jtdx/sounds/MyCall.wav"
	install -Dm744 "$srcdir/jtdx/sounds/PxOB.wav" "$pkgdir/opt/jtdx/sounds/PxOB.wav"
	install -Dm744 "$srcdir/jtdx/sounds/Px.wav" "$pkgdir/opt/jtdx/sounds/Px.wav"
	rm -rf $pkgdir/home
}

