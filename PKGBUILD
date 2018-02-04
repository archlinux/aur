# Maintainer: Simon Marquardt <simon.marquardt@posteo.de>
pkgname=leitz-icon
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="driver for Leitz Icon label printer"
arch=('x86_64')
url="https://support.leitz.com/hc/de/community/posts/207467817/comments/115004415228"
license=('unknown')
groups=()
depends=('cups')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://web.leitz-cloud.com/1/files/share/511/Public/Software/Linux/Drivers/LeitzIconDriversForLinux1.0.3.zip/449f3bc489b024")
noextract=()
md5sums=('5457e0fb8ca2d79998ddc9237d76bc42')
validpgpkeys=()

build() {
	cd "LeitzIconDriversForLinux$pkgver"
	gcc -std=gnu99 -o raster2printer raster_c_functions.c raster2printer.c -lcups -lcupsimage
}

package() {
	cd "LeitzIconDriversForLinux$pkgver"
	install -dm 755 "${pkgdir}"/usr/lib/cups/filter
	install -m 755 raster2printer "${pkgdir}"/usr/lib/cups/filter
	install -dm 755 "${pkgdir}"/usr/share/ppd/"${pkgname}"
	install -m 644 PPD/LeitzIcon.ppd.gz "${pkgdir}"/usr/share/ppd/"${pkgname}"
	install -m 644 Resources/LeitzPrintIcon.icns "${pkgdir}"/usr/share/ppd/"${pkgname}"
}
