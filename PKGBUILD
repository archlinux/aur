# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=runit-conversion
pkgver=1
pkgrel=1
pkgdesc="Convert your system to use runit instead of systemd"
arch=('any')
url="https://smarden.org/runit"
license=('GPL')
depends=('base-init-agnostic' 'kisslinux-init' 'runit' 'systemd-libs-fake' 'eudev')
optdepends=('runit-services: many service definitions')
source=('2' 'reboot' 'poweroff' 'shutdown')
sha256sums=('8516f76f250e15c27c7713d45e75c5ddaa6cf9abc13f066b695fef94aded0418'
            'aa2f3d56dd7f2c1e8810f7d0e3046129d7b1c2dc14c2c4d41c1a3ed466d34541'
            '9c4e8cba8ffc2e3b546401317ef6567acf71e07fe4b0ec0ac6c0f98457e08d1d'
            '0ff5be0b1124c7a8cbe06bd3968be51d4d96782cf96c3dddaa1661fa8f811e9a')

package() {
	install -Dm755 "2" "$pkgdir/etc/runit/2"
	ln -s "/usr/lib/init/rc.boot" "$pkgdir/etc/runit/1"
	ln -s "/usr/lib/init/rc.shutdown" "$pkgdir/etc/runit/3"

	install -d "$pkgdir/usr/bin"
	install -Dm755 "reboot" "poweroff" "shutdown" "$pkgdir/usr/bin"
	ln -s "poweroff" "$pkgdir/usr/bin/halt"

	ln -s "runit-init" "$pkgdir/usr/bin/init"
}
