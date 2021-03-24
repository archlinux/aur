# Maintainer: Mark Wagie <mark dot wagie at tutantota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
pkgname=clightd
pkgver=5.3
pkgrel=1
pkgdesc="Bus interface to change screen brightness and capture frames from webcam."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/FedeDP/Clightd"
license=('GPL')
depends=('systemd-libs>=237' 'linux-api-headers' 'libx11' 'libxrandr' 'libxext' 'polkit'
         'ddcutil>=0.9.5' 'libmodule>=5.0.0' 'libjpeg-turbo' 'libusb' 'libdrm' 'wayland')
makedepends=('git' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('05e109618cf2d4b31bc37780bbc60c58bc7064fe1d27e8d504d3fef318099a31')

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
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
