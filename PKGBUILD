# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=0.74
pkgrel=1
pkgdesc="Web frontend to MPD"
arch=('any')
url="http://sourceforge.net/projects/rompr/"
license=('custom')
depends=('mpd' 'imagemagick' 'php')
optdepends=('apache'
'lighttpd'
'nginx'
'php-jsonreader-git: Low Memory Mode')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.zip)
md5sums=('8b83ef0f379d024c7792376cab55954d')

build () {

	cd "${srcdir}/${pkgname}"
	sed -i 's|PATH-TO-ROMPR|srv/http/rompr|' apache_conf.d/rompr.conf

}

package() {

	cd "${srcdir}"
	find -name '.svn' -delete
	install -Dm 644 "${srcdir}/${pkgname}/apache_conf.d/rompr.conf" "${pkgdir}/etc/httpd/conf/extra/rompr.conf"
	install -d "${pkgdir}/srv/http"
	cp -ra rompr "${pkgdir}/srv/http"

}
