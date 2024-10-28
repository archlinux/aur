# Maintainer: Alexander Lessacher <cc69222@gmail.com>
pkgname="dfcgen-gtk"
pkgver=0.6
pkgrel=1
pkgdesc="A free tool for the design of time-discrete (digital) filters/systems."
arch=("x86_64" "i686")
url="http://dfcgen.rho62.de/"
license=('GPLv2')
depends=('gtk3' 'gsl')
provides=(dfcgen-gtk)
source=("http://dfcgen.rho62.de/${pkgname}3/${pkgname}_$pkgver-$pkgrel.tar.gz")
sha512sums=("e85781bc28af088c3a7f69d82d0f70af78e30dcde2a076492634597b1a2a27ea924ee621ddb8225c8d62b0e3f30841ce17ab67306559e4d351cf4c63bf3d8fe9")

build(){
	cd "${srcdir}/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/applications"
	install -d "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
	install -m 0644 "${srcdir}/$pkgname-$pkgver/dist/debian/dfcgen-gtk.desktop" "${pkgdir}/usr/share/applications"
	install -m 0644 "${srcdir}/$pkgname-$pkgver/dist/debian/dfcgen-gtk.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
}
