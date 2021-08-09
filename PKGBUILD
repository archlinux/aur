# Maintainer: Matthew Hiles <matthew.hiles@hpe.com>
pkgname=via
pkgver=4.2.0.2105106
pkgrel=1
epoch=
pkgdesc="Aruba Networks' Virtual Intranet Access (VIA)"
arch=('x86_64')
url="https://asp.arubanetworks.com/downloads;fileTypes=SOFTWARE;products=Aruba%20Virtual%20Intranet%20Access%20%28VIA%29;fileContents=Linux"
license=('unknown') # have not been able to find this
groups=()
depends=()
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
source=("https://h30326.www3.hpe.com/hpn/via-4.2.0.2105106-rpm.x86_64.rpm?merchantId=ASP_DROPBOX")
noextract=()
sha256sums=('ef2bee83b0041e33b4250f0c53f6d25365182daee5723d2b6c04e80c203cdbcf')
validpgpkeys=()

prepare() {
	cd "$srcdir"
	## Make work with arch's root fs layout
	cd usr
	mv lib64 lib
	cd ..
	## fix up some file conflicts with via (the QMK keyboard configurator)
	find -name via.png -execdir mv {} anvia.png \;
	mv usr/share/applications/via.desktop usr/share/applications/anvia.desktop
	sed -i -e 's/Icon=via/Icon=anvia/' usr/share/applications/anvia.desktop
}

package() {
	#cd "$pkgname-$pkgver"
	cp -R "$srcdir/usr" "$srcdir/etc" "$pkgdir/"
	cp -R "$srcdir/lib64/security" "$pkgdir/usr/lib/"
	#rpmextract.sh ../$pkgname-$pkgver*.rpm*
}
