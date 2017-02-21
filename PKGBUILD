# Maintainer: Bruno Renié <brutasse@gmail.com>
pkgname=vaudtax
pkgver=2016
_pkgver=1.1.3-production
pkgrel=3
pkgdesc="VaudTax"
url="http://www.vd.ch/themes/etat-droit-finances/impots/vaudtax/"
depends=('webkitgtk2' 'jre8-openjdk' 'gnome-vfs')
arch=(i686 x86_64)
license=('custom')
source=('https://vaudtax-dl.vd.ch/vaudtax2016/telechargement/linux/VaudTax_2016.tar.gz'
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
md5sums=('6383b8b3327a661eb1deb47be7a2ed40'
         '50de86f022910871d336571832e5f810')
