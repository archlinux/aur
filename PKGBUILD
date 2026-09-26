# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-ipki
pkgver=1.4.10.542
pkgrel=4
pkgdesc="InfoNotary add-on for the Bit4ID Universal Middleware (enables support for InfoNotary smart cards)"
arch=('any')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install
# This package used to ship its own (older) copy of the library, which conflicted with bit4id-xpki.
# The library in bit4id-xpki supports InfoNotary cards too, as long as InfoNotary's token license file is present,
# so we only ship that (and InfoNotary's compatibility symlinks) on top of bit4id-xpki.
depends=('bit4id-xpki')

_file_name=$pkgname'_'$pkgver'-1_amd64.deb'
source=('http://repository.infonotary.com/install/linux/DEBS22/pool/non-free/b/bit4id-ipki/'$_file_name)
sha256sums=('d5747b2fe4a75fa9b810bd13683fa2703a121808bccf6c8640c74e9b135f3bf4')

package() {
	bsdtar -xOf "$_file_name" data.tar.xz | bsdtar -xf - -C "$srcdir" ./usr/lib/bit4id/libbit4xpki.so.rc

	install -Dm644 -t "$pkgdir/usr/lib/bit4id/libbit4xpki.so.rc" "$srcdir/usr/lib/bit4id/libbit4xpki.so.rc/incardtspinpad_00000401.lic"

	ln -s bit4id/libbit4xpki.so "$pkgdir/usr/lib/libbit4ipki.so"
	ln -s bit4id/libbit4xpki.so "$pkgdir/usr/lib/libbit4p11.so.0"
}
