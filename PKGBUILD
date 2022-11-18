# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd-no-ddc
_pkgname=clightd
pkgver=5.7
pkgrel=2
pkgdesc="Bus interface to change screen brightness based on ambient brightness (DDC disabled)."
arch=('x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL')
depends=('systemd-libs' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit'
         'libmodule' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
conflicts=('clightd')
provides=('clightd')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('75a01ee5f314866291efd66f2639516e3a7aa06da6ec5ea33f81211dc1082efa')

build() {
  cmake -B build -S Clightd-$pkgver \
    -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/"$_pkgname" \
    -DENABLE_DDC=0 \
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
