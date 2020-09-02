# Maintainer: Mees Luten <mees.luten@gmail.com>

pkgname=gr-hrpt
pkgver=0.1
pkgrel=2
pkgdesc="HRPT Blocks from gr-noaa and others ported to GNU Radio 3.8+"
arch=(x86_64)
url="https://gitlab.altillimity.com/altillimity/gr-hrpt"
license=('GPL3')
depends=(gnuradio liborcus)
makedepends=(boost boost-libs cmake)
source=("https://gitlab.altillimity.com/altillimity/gr-hrpt/-/archive/master/gr-hrpt-master.tar.gz")
sha256sums=('c1e730d3717c73037b8ceee3fce10320cc06d0da8225a16591caa543bd9abf6f')

prepare() {
	rm -f -r $pkgname
	mv gr-hrpt-master $pkgname
	mkdir -p "$pkgname"/build
}

build() {
	cd "$pkgname"/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j 4
}

package() {
	cd "$pkgname"/build
	make DESTDIR="$pkgdir/" install
}
