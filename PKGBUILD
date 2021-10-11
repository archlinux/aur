# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
# This package is build from a non-release version, going to change soon.
pkgname=gr-hrpt
pkgver=r27.7f3bc69
pkgrel=2
pkgdesc="HRPT Blocks from gr-noaa and others ported to GNU Radio 3.8+"
arch=('x86_64')
url="https://github.com/altillimity/gr-hrpt"
license=('GPL3')
depends=(gnuradio liborcus)
makedepends=(boost boost-libs cmake git)
source=("$pkgname"::'git+https://github.com/altillimity/gr-hrpt.git')
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
#	rm -f -r $pkgname
#	mv gr-hrpt-master $pkgname
	mkdir -p "$pkgname"/build
}

build() {
	cd "$pkgname"/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname"/build
	make DESTDIR="$pkgdir/" install
}
