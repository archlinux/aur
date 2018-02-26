# Maintainer: Bruno Renié <brutasse@gmail.com>
pkgname=vaudtax
pkgver=2017
_pkgver=1.3.0-production
pkgrel=2
pkgdesc="VaudTax"
url="http://www.vd.ch/themes/etat-droit-finances/impots/vaudtax/"
depends=('webkitgtk2' 'jre8-openjdk' 'gnome-vfs')
arch=(i686 x86_64)
license=('custom')
source=("$pkgname-$_pkgver.tar.gz::https://vaudtax-dl.vd.ch/vaudtax$pkgver/telechargement/linux/VaudTax_$pkgver.tar.gz"
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
md5sums=('5de215e9fa581da2d27e840c099fcc75'
         'a379a4fdb08eb3ef43f4e0ea8842454c')
