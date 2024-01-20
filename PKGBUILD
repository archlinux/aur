# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd
pkgver=5.8
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL-3.0-or-later')
depends=('systemd-libs' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit'
         'ddcutil' 'libmodule' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('89f0906bc2c1dd4f9bd62194499fd156197c211760c4bb1adcb149650f852684')

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
