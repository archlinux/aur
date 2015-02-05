# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Julien MISCHKOWITZ <wain@archlinux.fr>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: ShadowKyogre <shadowkyogre@aim.com>

pkgname=compiz-deskmenu
pkgver=20130330
pkgrel=1
pkgdesc="Compiz Fusion deskmenu plugin"
arch=('i686' 'x86_64')
url="http://opencompositing.org"
license=('GPL')
depends=('libwnck' 'dbus-glib' 'python-lxml' 'pyxdg')
makedepends=('git' 'intltool')
install=${pkgname}.install
source=(git://anongit.compiz.org/users/crdlb/compiz-deskmenu
	huge.patch
	compiz-deskmenu-editor)
md5sums=('SKIP'
	'9515713c15f412fb22cd2f735291fc74'
         'f9b8d902d85f7f690c32e330807d0e86')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package()
{
	cd "${srcdir}/${pkgname}"
	patch -Np1 -i $srcdir/huge.patch
	#rm -v "${srcdir}/${pkgname}/{deskmenu.c,deskmenu-common.h,org.compiz_fusion.deskmenu.service,deskmenu-service.xml}"
}

build()
{
	cd "${srcdir}/${pkgname}"
	make
}

package()
{
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -m 755 "${srcdir}/${pkgname}/autoconfig-compiz.py" "${pkgdir}/usr/bin/compiz-deskmenu-autoconfig"
}
