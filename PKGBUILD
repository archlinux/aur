# Maintainer: Zeta Gabriels <zetagabriels@gmail.com>
_pkgname=userspace-tablet-driver-daemon
pkgname=userspace-tablet-driver-daemon
pkgver=0.1.4
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
conflicts=(userpace-tablet-driver-daemon-git)
replaces=()
backup=()
options=()
install=ustdd.install
changelog=
source=(git+"${url}")
noextract=()
md5sums=()
validpgpkeys=()
sha256sums=('SKIP')

prepare() {
	if [ ! -d "${srcdir}/${_pkgname}" ]
	then
		cd ${srcdir}
		git clone $url --branch release --single-branch --depth 1
	else
		cd "${srcdir}/${_pkgname}"
		git fetch --depth 1 origin release
		git reset --hard origin/release
	fi
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake .
	make
}

package() {
	make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
	sudo udevadm trigger
}
