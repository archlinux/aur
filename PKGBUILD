# Maintainer: Shuyuan Liu (AUR)

pkgname=dsb-demodulator-git
pkgver=r1.200e870
pkgrel=1
pkgdesc="Demodulator for the NOAA DSB signal, port of Project-Desert-Tortoise"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/altillimity/DSB-Demodulator"
license=('GPL3')
makedepends=('git' 'cmake')
provides=('dsb-demodulator')
conflicts=('dsb-demodulator')
md5sums=('SKIP')

source=('git+https://github.com/altillimity/DSB-Demodulator')

pkgver() {
	cd DSB-Demodulator
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd DSB-Demodulator
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd DSB-Demodulator/build
	make DESTDIR="$pkgdir/" install
}

