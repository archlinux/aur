# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=k780-fnkeyctl
pkgver=2
pkgrel=1
pkgdesc="Logitech K780 Fn-key configuration"
arch=('i686' 'x86_64')
url="https://google.com"
license=('MIT')
groups=()
depends=('libusb')
source=(k780swap
99-k780-config.rules
k780-fnkeyctl.sh)
sha256sums=(e16229978da17479bb9d4917c8abcd640893a506451350f389a3ccb6e202e5d3
5966a4678955de2a914a4ad2156330050b5ff12be11977568a3bd62c022029a3
98e2a3962c1d085e5e37b9b45b7a19734e3d0678554c0e1bfe12d753da860e19)

build() {
    return 0
}

package() {
	# udev script
	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp 99-k780-config.rules "$pkgdir/etc/udev/rules.d/99-k780-config.rules"
	# systemd post-sleep script
	mkdir -p "$pkgdir/usr/lib/systemd/system-sleep"
	cp k780-fnkeyctl.sh "$pkgdir/usr/lib/systemd/system-sleep/k780-fnkeyctl.sh"
	chmod +x "$pkgdir/usr/lib/systemd/system-sleep/k780-fnkeyctl.sh"

	cd "$srcdir"
	# main binary
	mkdir -p "$pkgdir/usr/bin"
	cp k780swap "$pkgdir/usr/bin"
}
