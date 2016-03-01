# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=moonlight-embedded
pkgver=2.1.4
pkgrel=1
pkgdesc="Gamestream client for embedded devices"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/irtimmer/moonlight-embedded"
license=('GPL')
depends=('curl' 'opus' 'alsa-lib' 'avahi' 'curl' 'libevdev' 'libsystemd')
depends_i686=('ffmpeg' 'sdl2')
depends_x86_64=('ffmpeg' 'sdl2')
makedepends=('libcec')
makedepends_armv7h=('raspberrypi-firmware-tools' 'imx-vpu')
makedepends_armv6h=('raspberrypi-firmware-tools')
optdepends=('raspberrypi-firmware-tools: Raspberry Pi support'
            'imx-vpu: i.MX6 support'
            'libcec: CEC support')
makedepends=('cmake')
source=("https://github.com/irtimmer/moonlight-embedded/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ef2d35fdd4daae25897bd000881da701fb767c9d1357704719fe9d9374d57a82')

build() {
  mkdir -p build
  cd build
  cmake ../moonlight-embedded-$pkgver -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}
