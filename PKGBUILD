# Maintainer: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=1.26
pkgrel=1
pkgdesc="Web frontend to MPD"
arch=('any')
url="https://github.com/fatg3erman/RompR/releases"
license=('custom')
depends=('mpd' 'imagemagick' 'php')
optdepends=('apache'
'lighttpd'
'nginx'
'php-jsonreader-git: Low Memory Mode')
source=(${url}/download/${pkgver}/${pkgname}-${pkgver}.zip)
md5sums=('b07ba8ab20c0494c4cfe219139f54cf0')

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
