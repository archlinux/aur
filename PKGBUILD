# Maintainer: Geyslan G. Bem <geyslan@gmail.com>

pkgname=ccid-morpho
pkgver=1.4.3_1morpho
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="A USB Chip/Smart Card Interface Device driver (SAFRAN MORPHO YpsID Token)"
arch=('i686' 'x86_64')
url="https://github.com/geyslan/morpho"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb')
optdepends=('pcsc-tools')
provides=("ccid=${pkgver}")
conflicts=('ccid')
install="$pkgname.install"
source_x86_64=("https://github.com/geyslan/morpho/raw/master/libccid_${_pkgver}_amd64.deb")
source_i686=("https://github.com/geyslan/morpho/raw/master/libccid_${_pkgver}_i386.deb")
md5sums_i686=('429f3f59c3781a62259b7fe701983515')
md5sums_x86_64=('20fb32fb2a418f1508b5a482b6c1b21b')

prepare() {
	tar zxf data.tar.gz
}

package() {
	cp -R usr "$pkgdir"

	# fix doc tree to standard
	# https://wiki.archlinux.org/index.php/Arch_packaging_standards#Directories
	mv "$pkgdir"/usr/share/doc/{libccid,$pkgname}

	# move the configuration file to /etc and create a symbolic link
	mkdir -p "$pkgdir/etc"
	mv "$pkgdir/usr/lib/pcsc/drivers/ifd-ypsid.bundle/Contents/Info.plist" "$pkgdir/etc/libccid_Info.plist"
	ln -s /etc/libccid_Info.plist "$pkgdir/usr/lib/pcsc/drivers/ifd-ypsid.bundle/Contents/Info.plist"
}

