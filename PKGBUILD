# Maintainer: piernov <piernov@piernov.org>

pkgname=opensuperclone-git
_pkgname=OpenSuperClone
pkgver=r101.33bd811
pkgrel=1
pkgdesc="Fork of HDDSuperClone"
arch=('x86_64')
url="https://github.com/ISpillMyDrink/OpenSuperClone"
license=('GPL2')
depends=('openssl' 'curl' 'gtk3' 'libusb-compat')
optdepends=('linux-headers: Direct AHCI kernel driver')
source=("git+https://github.com/ISpillMyDrink/OpenSuperClone.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	mkdir -p build && cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname/build"
	make DESTDIR="${pkgdir}" install
}
