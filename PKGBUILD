# Maintainer: km3k <khbecker@gmail.com>
pkgname=brscan-ds
pkgver=1.0.5
pkgrel=1
pkgdesc="SANE drivers from Brother for DS Series USB scanners"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('custom:brother commercial license')
depends=('sane' 'libusb-compat')
if [ "$CARCH" == "i686" ]; then
   source=(
		"http://www.brother.com/pub/bsc/linux/dlf/libsane-dsseries-$pkgver-1.i586.rpm"
		'scanner-license.txt'
		)
	md5sums=('3dc145b7e061ca57a1fe12c245d2c2c0' '1bd5f896f3e97fe6d53a85b4d5a4ea79')
else
     source=(
		"http://www.brother.com/pub/bsc/linux/dlf/libsane-dsseries-$pkgver-1.x86_64.rpm"
		'scanner-license.txt'
		)
	md5sums=('905610438d279cacf50de973a5f270cf' '1bd5f896f3e97fe6d53a85b4d5a4ea79')
fi
package() {
	cp -Rf "$srcdir/usr" "$pkgdir"
	cp -Rf "$srcdir/etc" "$pkgdir"
	mkdir -p "$pkgdir/etc/sane.d/dll.d"
	echo "dsseries" > "$pkgdir/etc/sane.d/dll.d/brscan-ds-scanner"
	install -m 644 -D scanner-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/scanner-licence.txt"

	# On x86_64, install in "/usr/lib" instead of "/usr/lib64"
	if	[ "$CARCH" == "x86_64" ]; then
		mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	fi
}
