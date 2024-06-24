# Maintainer: Raphaël Gallais-Pou <rgallaispou@gmail.com>

_basename=OpenCSD
pkgname=libopencsd
pkgver=v1.5.2.r0.g5d86f27
pkgrel=1
pkgdesc="A library to decode ARM Coresight traces"
arch=('any')
url="https://github.com/Linaro/${_basename}"
license=('BSD-3-Clause')
depends=()
makedepends=()
provides=(libopencsd.so)
conflicts=("$pkgname")
options=()
install=
changelog=
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_basename"/decoder/build/linux
	make -j$(nproc)
}

package() {
	cd "$_basename"/decoder/build/linux
	make DESTDIR="$pkgdir" DEF_SO_PERM=755 install install_man
}
