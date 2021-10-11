# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=gr-hrpt-git
pkgver=r27.7f3bc69
pkgrel=1
pkgdesc="HRPT Blocks from gr-noaa and others ported to GNU Radio 3.8+"
arch=('x86_64')
url="https://github.com/altillimity/gr-hrpt"
license=('GPL3')
depends=(gnuradio liborcus)
replaces=(gr-hrpt)
provides=()
conflicts=()
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
