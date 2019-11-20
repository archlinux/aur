# Maintainer: Bruno Renié <brutasse@gmail.com>
pkgname=vaudtax
pkgver=2018
_pkgver=1.2.1-production
pkgrel=3
pkgdesc="VaudTax"
url="https://www.vd.ch/themes/etat-droit-finances/impots/impots-pour-les-individus/remplir-ma-declaration-dimpot/vaudtax-2018/"
depends=('webkitgtk2' 'jre8-openjdk' 'gnome-vfs')
arch=(x86_64)
license=('custom')
source=("$pkgname-$pkgver-$_pkgver.tar.gz::https://vaudtax-dl.vd.ch/vaudtax$pkgver/telechargement/linux/64bit/VaudTax_$pkgver.tar.gz" 'vaudtax')
_dirname="VaudTax_$pkgver-$_pkgver-64bit"

prepare() {
	cd "$_dirname"
}
build() {
	cd "$_dirname"
}
package() {
	cd "$_dirname"

	# skip provided libwebkitgtk.so
	rm -rf lib/ubuntu

	_app_home=/usr/share/${pkgname}

	install -d "${pkgdir}"{${_app_home}/bin,/usr/bin}

	cp -r lib "${pkgdir}${_app_home}"
	cp -r config "${pkgdir}${_app_home}"
	install -D -m644 version.xml "${pkgdir}${_app_home}/version.xml"

	install -m755 ${srcdir}/${pkgname} "${pkgdir}"${_app_home}/bin/${pkgname}
	ln -s ${_app_home}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
md5sums=('50320be78002b94007d2fa9f9a2b0901'
         '1b797df588e1d3851c67c7aee1f3f844')
