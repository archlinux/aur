# Maintainer: Iwan Timmer <irtimmer@gmail.com>

pkgname=moonlight-embedded
pkgver=2.1.2
pkgrel=1
pkgdesc="Gamestream client for embedded devices"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/irtimmer/moonlight-embedded"
license=('GPL')
depends=('curl' 'opus' 'alsa-lib' 'avahi' 'curl' 'libevdev' 'libsystemd')
depends_i686=('ffmpeg' 'sdl2-hg')
depends_x86_64=('ffmpeg' 'sdl2-hg')
makedepends=('libcec')
makedepends_armv7h=('raspberrypi-firmware-tools' 'imx-vpu')
makedepends_armv6h=('raspberrypi-firmware-tools')
optdepends=('raspberrypi-firmware-tools: Raspberry Pi support'
            'imx-vpu: i.MX6 support'
            'libcec: CEC support')
makedepends=('cmake')
source=("https://github.com/irtimmer/moonlight-embedded/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ac1844018226894cf23a8494c720069360fecbaeeecc0327d6d3a992881cee0e')

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
