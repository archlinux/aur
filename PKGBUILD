# Maintainer : silverhikari <kerrickethan@gmail.com>
# Contributor: Zeta Gabriels <zetagabriels@gmail.com>
pkgname=userspace-tablet-driver-daemon-git
pkgver=r188.6523fe9
pkgrel=1
epoch=1
pkgdesc="A userspace daemon for XP-Pen and Huion tablets."
arch=("x86_64")
url="https://github.com/kurikaesu/userspace-tablet-driver-daemon.git"
license=('GPL3')
makedepends=('git' 'cmake' 'make')
provides=(userspace_tablet_driver_daemon)
conflicts=(userpace-tablet-driver-daemon)
install=ustdd.install
source=(git+"${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-git}" \
	-DCMAKE_INSTALL_PREFIX='/'
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	sudo udevadm trigger
}
