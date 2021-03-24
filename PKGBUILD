# Maintainer: Gaby <gabriel@saillard.dev>

pkgname=spline
pkgver=0.3.0
pkgrel=2
pkgdesc="A design tool for 3D web experiences."
arch=('x86_64')
url='https://spline.design'
provides=('spline')
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'xdg-utils')
source=("https://cdn.spline.design/_assets/spline_${pkgver}_amd64.zip")
sha256sums=('cd93a7527355014f74199c32ddea8d6c5a9462826efb34b0461e833f16e9f5fa')

prepare() {
	cd $srcdir
	ar x spline*.deb data.tar.xz
	tar xJf data.tar.xz
	rm spline*.deb
	rm data.tar.xz
}

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r "${srcdir}/usr/lib/${pkgname}/" "${pkgdir}/opt/"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}-design"
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp "${srcdir}/usr/share/pixmaps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/"
}
