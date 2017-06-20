# Maintainer: Ryan Tolboom <Ryan.Tolboom@monroe.k12.nj.us>
pkgname=processmaker
pkgver=3.2
pkgrel=1
pkgdesc="Open source web based workflow software and Business Process Management software"
arch=(any)
url="https://www.processmaker.com"
license=('AGPLv3')
depends=(apache mysql55 php56 php56-apache php56-gd php56-ldap php56-mcrypt)
backup=(etc/httpd/conf/extra/pmos.conf)
install=${pkgname}-${pkgver}.install
source=("https://downloads.sourceforge.net/project/${pkgname}/ProcessMaker/${pkgver}/${pkgname}-${pkgver}-community.tar.gz"
        "pmos.conf")
noextract=("${pkgname}-${pkgver}-community.tar.gz")
md5sums=('57caa5f467cfbe87e54c46714ce01e53'
         '3d0be1a15ebf8e89b318fea3f4b64ba9')

package() {
  mkdir -p $pkgdir/etc/httpd/conf/extra
  cp pmos.conf $pkgdir/etc/httpd/conf/extra

	mkdir -p $pkgdir/opt
	tar -C $pkgdir/opt -zxf ${pkgname}-${pkgver}-community.tar.gz
	cd $pkgdir/opt/processmaker
	chmod -R 770 shared workflow/public_html gulliver/js gulliver/thirdparty/html2ps_pdf/cache
	cd workflow/engine/
	chmod -R 770 config content/languages plugins xmlform js/labels
	chown -R http:http  $pkgdir/opt/processmaker
}
