# Maintainer: Bruno Renié <brutasse@gmail.com>
pkgname=vaudtax
pkgver=2017
_pkgver=1.2.2-production
pkgrel=1
pkgdesc="VaudTax"
url="http://www.vd.ch/themes/etat-droit-finances/impots/vaudtax/"
depends=('webkitgtk2' 'jre8-openjdk' 'gnome-vfs')
arch=(i686 x86_64)
license=('custom')
source=("https://vaudtax-dl.vd.ch/vaudtax$pkgver/telechargement/linux/VaudTax_$pkgver.tar.gz"
'execute_from_usr_share.patch')
_dirname="VaudTax_$pkgver-$_pkgver"

prepare() {
	cd "$_dirname"
}
build() {
	cd "$_dirname"
}
package() {
	cd "$_dirname"
	patch -p1 < ../execute_from_usr_share.patch

	_app_home=/usr/share/${pkgname}

	install -d "${pkgdir}"{${_app_home}/bin,/usr/bin}

	cp -r lib "${pkgdir}${_app_home}"
	cp -r config "${pkgdir}${_app_home}"
	install -D -m644 version.xml "${pkgdir}${_app_home}/version.xml"

	cp ${pkgname}-${pkgver} "${pkgdir}"${_app_home}/bin/${pkgname}
	ln -s ${_app_home}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
md5sums=('ecad1c1335ad14883d3e478e69f4afe2'
         'a379a4fdb08eb3ef43f4e0ea8842454c')
