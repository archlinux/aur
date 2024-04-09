# Maintainer: Cameron Gutman <aicommander@gmail.com>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=moonlight-embedded
pkgver=2.7.0
pkgrel=1
pkgdesc="Gamestream client for embedded devices"
arch=('armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/moonlight-stream/moonlight-embedded"
license=('GPL')
depends=('curl' 'avahi' 'libevdev' 'sdl2' 'ffmpeg' 'opus' 'libdrm')
makedepends=('libcec' 'cmake')
makedepends_aarch64=('v4l-utils' 'aml-libs-c2')
makedepends_armv7h=('raspberrypi-firmware-tools' 'imx-vpu' 'linux-imx6-headers' 'v4l-utils' 'aml-libs-c1')
makedepends_armv6h=('raspberrypi-firmware-tools')
optdepends=('raspberrypi-firmware-tools: Raspberry Pi support'
            'imx-vpu: i.MX6 support'
            'aml-libs-c1: ODROID-C1 support'
            'aml-libs-c2: ODROID-C2 support'
            'libcec: CEC support')
source=("https://github.com/moonlight-stream/moonlight-embedded/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('6527718e678dafd6e1e1876bbc6949538b38986d54ebda0b7fdc3b3f4af4f2dd')

build() {
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
