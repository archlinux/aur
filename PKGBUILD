# Maintainer: Andrej Radovic <r.andrej@gmail.com>

pkgname=multibootusb-git
pkgver=20181002.dec46ef
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=(
	"lsof"
	"mtools"
	"p7zip"
	"parted"
	"python-dbus"
	"python-pyqt5"
	"python-pyudev"
)
makedepends=("git")
provides=("multibootusb")
conflicts=("multibootusb")
source=("${pkgname}"'::git+https://github.com/mbusb/multibootusb.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	chmod 755 "$srcdir/$pkgname/data/multibootusb.desktop"
}
