# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=moonlight-embedded
pkgver=2.0
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
sha256sums=('5671b6c5b33357ea2a2e2882d42e852590983f55fd6779eb0d2de1f08f0226b5')

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
