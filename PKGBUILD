# Maintainer: Zeta Gabriels <zetagabriels@gmail.com>
pkgname=userspace-tablet-driver-daemon-git
pkgver=r118.6f2475f
pkgrel=1
epoch=
pkgdesc="A userspace daemon for XP-Pen and Huion tablets."
arch=("x86_64")
url="https://github.com/kurikaesu/userspace-tablet-driver-daemon.git"
license=('GPL3')
groups=()
depends=()
makedepends=(git cmake make)
checkdepends=()
optdepends=()
provides=(userspace_tablet_driver_daemon)
conflicts=()
replaces=()
backup=()
options=()
install=ustdd.install
changelog=
source=(ustdd::"git+$url")
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=('SKIP')

pkgver() {
	cd ustdd
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ustdd
	cmake .
	make
}

package() {
	make -C ustdd DESTDIR="$pkgdir" install
	sudo udevadm trigger
}
