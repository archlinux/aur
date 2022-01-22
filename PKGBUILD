# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd
pkgver=5.5
pkgrel=2
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL')
depends=('systemd-libs' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit'
         'ddcutil' 'libmodule' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a2153db7a4ed49f8aaab10b4e72c1aba8cb46c773652017a9eb6fe12ad7496f3')

build() {
  cmake -B build -S Clightd-$pkgver \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/"$pkgname" \
    -DENABLE_DDC=1 \
    -DENABLE_GAMMA=1 \
    -DENABLE_DPMS=1 \
    -DENABLE_SCREEN=1 \
    -DENABLE_YOCTOLIGHT=1 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
