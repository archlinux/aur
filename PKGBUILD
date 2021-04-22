# Maintainer: Static_Rocket

pkgname=asusctl-git
pkgver=3.4.1.r11.gab80b07
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asus-nb-ctrl"
license=('MPL2')
depends=('libusb' 'udev' 'systemd')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
provides=('asusctl')
conflicts=('asus-nb-ctrl-git')
source=('git+https://gitlab.com/asus-linux/asusctl.git')
md5sums=('SKIP')
_gitdir=${pkgname%"-git"}

pkgver() {
	cd "$srcdir/$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitdir"
	make build
}

package() {
	cd "$srcdir/$_gitdir"
	make DESTDIR="$pkgdir" install
}

