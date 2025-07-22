# Submitter: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgname=ttyd-addon
pkgver=1.1.0
pkgrel=1
pkgdesc='Addons for ttyd, which provides sharing your terminal over the web'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
depends=('ttyd')
source=("ttyd.service"
	"https://raw.githubusercontent.com/eklausme/c/master/slogin.c")
sha512sums=('98639a2ee9e2f50b173b8f6e4d754133f7712283b6a9c1c0870388e609aca8be587d963e4144352f62a50ce30ff432cc79da61f8df290214109c1c9c9871aaa1'
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

