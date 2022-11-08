# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=librtlsdr-git
_pkgname=librtlsdr
pkgver=r646.710d578
pkgrel=1
license=("GPLv2")
pkgdesc=" Software to turn the RTL2832U into an SDR"
makedepends=(
	"git"
	"libusb"
)

depends=(
	"libusb"
)

arch=("x86_64")
url="https://github.com/librtlsdr/librtlsdr"
source=("${pkgname%-*}::git+https://github.com/librtlsdr/librtlsdr")
sha512sums=('SKIP')

provides=("librtlsdr")
conflicts=("librtlsdr")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	cmake . -DINSTALL_UDEV_RULES=OFF -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
	make
}


package() {
	cd "$srcdir/$_pkgname"
	make install
}

