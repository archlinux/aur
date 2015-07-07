# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=moonlight-embedded
pkgver=2.0.2
pkgrel=1
pkgdesc="Gamestream client for embedded devices"
arch=('armv6h' 'armv7h')
url="https://github.com/irtimmer/moonlight-embedded"
license=('GPL')
depends=('curl' 'opus' 'alsa-lib' 'avahi' 'curl' 'libevdev' 'libsystemd')
makedepends_armv7h=('raspberrypi-firmware-tools' 'imx-vpu')
makedepends_armv6h=('raspberrypi-firmware-tools')
optdepends=('raspberrypi-firmware-tools: Raspberry Pi support'
            'imx-vpu: i.MX6 support')
makedepends=('cmake')
source=("https://github.com/irtimmer/moonlight-embedded/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('a9b7f434853e7a5612c22c8f1e57ac0087c24c0c95dc06d38fdf3b7e0d8b16b2')

build() {
  mkdir -p build
  cd build
  cmake ../moonlight-embedded-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
