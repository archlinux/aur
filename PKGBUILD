# Submitter: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd-addon
pkgver=1.0.0
pkgrel=1
pkgdesc='Addons for ttyd, which provides sharing your terminal over the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('ttyd')
source=("ttyd.service"
	"https://raw.githubusercontent.com/eklausme/c/master/slogin.c")
sha512sums=('e265ed981d1a2a4a49005864aa7f7d88dc03455375434ce557daf9bb928401aaeab553bce1f5ef2116490c0d7ff78377163a601e78ebabcc5750cbf845489710'
            '1cebf87e06f6303c48d931a87614f05d7300b4fba45ac5bf5a56ac20a0c9f48a1997bce13611ab3b498eed991a74594318c49ae801595fc882755dc1928640bb')


build() {
	cc -Wall slogin.c -o slogin -lpam -lpam_misc -lutil
}

package() {
	# Install SystemD related files
	install -D -m644 ttyd.service   "${pkgdir}/usr/lib/systemd/system/ttyd.service"

	# Install simplified login devoid of signal-handling
	install -D -m755 slogin	"${pkgdir}/usr/bin/slogin"
}

