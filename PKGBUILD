# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=2.09
pkgrel=1
pkgdesc="A php web frontend to MPD and Mopidy"
arch=('any')
url='https://github.com/fatg3erman/RompR/'
license=('custom')
depends=('imagemagick'
         'php' # note that dependencies php-json, php-curl, php-xml and php-mbstring are included in php
         'php-sqlite'
         'php-gd'
         'php-intl')
conflicts=('rompr<2.00')
optdepends=('apache: webserver to serve app'
            'nginx: webserver to serve app'
            'mysql: alternate database platform to sqlite'
	    'python: for websocket server')
source=("https://github.com/fatg3erman/RompR/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('f8fe95209af8fea7f93f8c6601b2be4c3197880e4250ebe5e763fd6aa9071493')
install="${pkgname}.install"
backup=("var/lib/${pkgname}/albumart"
	"var/lib/${pkgname}/prefs")
options=('emptydirs')

package() {
   cd "${srcdir}"
   find -name '.svn' -delete
   install -d "${pkgdir}/usr/share/webapps"
   cp -ra "$pkgname" "${pkgdir}/usr/share/webapps/"
   install -d "${pkgdir}/var/lib/${pkgname}/albumart"
   ln -s "/var/lib/${pkgname}/albumart" "${pkgdir}/usr/share/webapps/${pkgname}/albumart"
   install -d "${pkgdir}/var/lib/${pkgname}/prefs"
   ln -s "/var/lib/${pkgname}/prefs"    "${pkgdir}/usr/share/webapps/${pkgname}/prefs"
   install -d "${pkgdir}/usr/share/licenses"
   ln -s "/usr/share/webapps/${pkgname}/LICENCE.txt" "${pkgdir}/usr/share/licenses/$pkgname"
}
