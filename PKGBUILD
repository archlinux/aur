# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=moonlight-embedded
pkgver=2.4.7
pkgrel=1
pkgdesc="Gamestream client for embedded devices"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/irtimmer/moonlight-embedded"
license=('GPL')
depends=('curl' 'avahi' 'curl' 'libevdev' 'enet' 'ffmpeg')
makedepends=('libcec')
makedepends_armv7h=('raspberrypi-firmware-tools' 'imx-vpu' 'linux-imx6-headers' 'v4l-utils' 'aml-libs-c1')
makedepends_armv6h=('raspberrypi-firmware-tools')
optdepends=('raspberrypi-firmware-tools: Raspberry Pi support'
            'imx-vpu: i.MX6 support'
            'aml-libs-c1: ODROID-C1 support'
            'libcec: CEC support')
makedepends=('cmake')
source=("https://github.com/irtimmer/moonlight-embedded/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('f78e7de28e190ea21ad567f2c580be384c53fa40f22d2ab8db16487c3e99fc56')

build() {
  mkdir -p build
  cd build
  cmake ../moonlight-embedded-$pkgver -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
