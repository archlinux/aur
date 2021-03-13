# Maintainer: Static_Rocket

pkgname=asus-nb-ctrl-git
pkgver=3.1.6.r0.g8a63dce
pkgrel=1
pkgdesc="Asus laptop control utilities"
arch=('x86_64')
url="https://gitlab.com/asus-linux/asus-nb-ctrl"
license=('MPL2')
depends=('libusb' 'udev' 'systemd')
optdepends=('acpi_call: fan control')
makedepends=('git' 'rust')
provides=('asus-nb-ctrl')
source=('git+https://gitlab.com/asus-linux/asus-nb-ctrl.git')
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

