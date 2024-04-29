# Contributor : silverhikari <kerrickethan@gmail.com>
# Contributor: Zeta Gabriels <zetagabriels@gmail.com>

pkgname=userspace-tablet-driver-daemon-git
pkgver=r190.56f3fb4
pkgrel=1
epoch=1
pkgdesc="A userspace daemon for XP-Pen and Huion tablets."
arch=("x86_64")
url="https://github.com/kurikaesu/userspace-tablet-driver-daemon.git"
license=('GPL-3.0-or-later')
depends=('libusb' 'gcc-libs')
makedepends=('git' 'cmake')
provides=(userspace-tablet-driver-daemon)
conflicts=(userpace-tablet-driver-daemon)
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
}
