# Maintainer: Mattia Procopio (astro.matto) <matto.astro at gmail dot com>
pkgname=indi-3rdparty-drivers
pkgver=2.2.1
pkgrel=1
pkgdesc="Indi 3rd party drivers"
arch=(x86_64 aarch64)
url="https://indilib.org"
license=(LGPLv2)
depends=(dfu-util
         fxload
         gpsd
         indi-3rdparty-libs
         libdc1394
         limesuite
         urjtag
         zeromq)
depends_aarch64=(dfu-util
                 fxload
                 gpsd
                 indi-3rdparty-libs
                 libdc1394
                 limesuite
                 pigpio
                 urjtag
                 zeromq)
makedepends=(cmake)
makedepends_aarch64=(cmake libgpiod)
source=(https://github.com/indilib/indi-3rdparty/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('b336df05a4e4313b02264e6cd59ecc78f0b37ac68eb895ffb617ae553a7db12a')
options=(!lto)
install=drivers.install

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	-DSKIP_SETCAP=yes \
	../indi-3rdparty-$pkgver
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
