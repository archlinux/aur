# Maintainer: Alexander Lessacher <cc69222@gmail.com>
pkgname="dfcgen-gtk"
pkgver=0.5
pkgrel=0
pkgdesc="A free tool for the design of time-discrete (digital) filters/systems."
arch=("x86_64" "i686")
url="http://www.dfcgen.de/"
license=('GPLv2')
depends=('gtk2' 'gsl')
provides=(dfcgen-gtk)
source=("http://www.dfcgen.de/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=("5d1f807a8894d6fc8acab40e0132281d4b961dd3403fbdcda4f9a3cd0130ae0289b897d29d3a231bf1cfa21039d2b842a6389feaece4996aae7470f8ce923929")

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
