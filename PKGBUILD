# Maintainer: Jerry <isjerryxiao at outlook dot com>
# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Anes Belfodil <ans.belfodil at gmail dot com>
# Contributor: David Rheinsberg <david.rheinsberg at gmail dot com>
# Contributor: David Herrmann <dh.herrmann at gmail dot com>

_pkgname=qemu-user-static
pkgdesc='A generic and open source machine emulator, statically linked'
pkgver=5.2
pkgrel=3

pkgname=$_pkgname-bin
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="http://wiki.qemu.org"
license=('GPL2' 'LGPL2.1')
depends=('binfmt-qemu-static')
makedepends=()
provides=("$_pkgname" "qemu-user")
conflicts=("$_pkgname" "qemu-user")

pkgadditver="+dfsg-6"
case $CARCH in
	# Add pkgadditver="something" to override for specific arch
	"x86_64") _debarch="amd64" ;;
	"i686") _debarch="i386" ;;
	"aarch64") _debarch="arm64" ;;
	"armv7h") _debarch="armhf" ;;
	"armv6h") _debarch="armel" ;;
	*) _debarch="$CARCH"
esac

source=("https://deb.debian.org/debian/pool/main/q/qemu/${_pkgname}_${pkgver}${pkgadditver}_${_debarch}.deb")
sha256sums=("SKIP")

prepare() {
	rm -Rf build
	mkdir build
}

build() {
	cd build
	tar -xJf ../data.tar.xz -C .
}

package() {
	cd build

	mkdir -p "$pkgdir"/usr/bin/
	cp usr/bin/qemu-*-static "$pkgdir"/usr/bin/

	mkdir -p "$pkgdir"/usr/share/man/man1
	cp usr/share/man/man1/qemu-*-static.1.gz "$pkgdir"/usr/share/man/man1/
}
