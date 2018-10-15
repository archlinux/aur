# Maintainer: Andrej Radovic <r.andrej@gmail.com>

pkgname=multibootusb-git
pkgver=20181002.dec46ef
pkgrel=1
pkgdesc="Boot multiple live Linux distros from a usb flash drive."
arch=("any")
url="http://multibootusb.org"
license=("GPL")
depends=("python-pyqt5" "pyqt5-common" "python-dbus" "mtools" "util-linux"
    "parted" "p7zip" "python-six" "python-pyudev" "lsof")
makedepends=("git")
provides=("multibootusb")
conflicts=("multibootusb")
source=("${pkgname}"'::git+git://github.com/mbusb/multibootusb.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

package() {
    cd "$srcdir/$pkgname"
    chmod 755 "$srcdir/$pkgname/data/multibootusb.desktop"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}
