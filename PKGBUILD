# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd
pkgver=5.9
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL-3.0-or-later')
depends=(
  'ddcutil'
  'libdrm'
  'libiio'
  'libjpeg-turbo'
  'libmodule'
  'libusb'
  'libx11'
  'libxext'
  'linux-api-headers'
  'libxrandr'
  'polkit'
  'systemd-libs'
  'wayland'
)
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('76ae865b5eeb721c98c23b1d4d8531b2b6c10b71386d0396b14666b5650f3054')

build() {
  cmake -B build -S Clightd-$pkgver \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
    -DENABLE_DDC='1' \
    -DENABLE_GAMMA='1' \
    -DENABLE_DPMS='1' \
    -DENABLE_SCREEN='1' \
    -DENABLE_YOCTOLIGHT='1' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
