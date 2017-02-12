# Maintainer: MartiMcFly <martimcfly at autorisation de

pkgname=asekey
pkgver=3.7
pkgrel=4
pkgdesc="ASEKey USB and SIM Reader driver for PCSC Lite"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
license=("LGPL")
depends=('pcsclite'
	 'libusb-compat')
url="http://www.athena-scs.com/support/software-driver-downloads"
# Offline: "http://www.athena-scs.com/docs/reader-drivers/asekey-3-7-tar.bz2"
source=("asekey-3-7-tar.bz2"
	"plist.patch")
md5sums=('2a66073c202e10becd8a0cdc55a720a9'
         '54a6bdf6a9e4a0b980a278227f32f93e')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}"/plist.patch
	./configure --prefix=/usr --with-udev-rules-dir=/usr/lib/udev/rules.d
        make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}

